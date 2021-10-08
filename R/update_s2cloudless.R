# Update the accuracies computed for s2clousless

base_dir <- "/home/alber-d006/Documents/github/clouds"
stopifnot(dir.exists(base_dir))




#---- Prolog ----

library(caret)
library(dplyr)
library(ensurer)
library(raster)

source(file.path(base_dir, "R", "/util.R"))




#---- Util ----

# @param base_dir      Directory with Sentinel images.
# @param mask_patthern Pattern of the file names of the cloud masks.
find_masks <- function(base_dir, mask_pattern){
    base_dir %>%
        list.dirs() %>%
        tibble::enframe(name = NULL) %>%
        dplyr::rename(file_path = "value") %>%
        dplyr::filter(endsWith(file_path, 
                               ".SAFE")) %>%
        dplyr::mutate(dir_name = tools::file_path_sans_ext(basename(file_path))) %>%
        tidyr::separate(col = dir_name, into = c("mission", "level", "img_date",
                                                 "baseline", "orbit", "tile",
                                                 "processing"), 
                        sep = '_')  %>%
        dplyr::mutate(mask_file = purrr::map_chr(file_path, 
                                                 find_files,
                                                 pattern = mask_pattern)) %>%
        dplyr::select(-file_path, -baseline, -processing, -level) %>%
        return()
}

# Join and filter the two classified point samples provided by experts
join_samples <- function(sf_1, sf_2) {
    sf_1 %>%
        sf::st_join(y = sf_2, 
                    join = sf::st_is_within_distance, 
                    dist = 1) %>%
        dplyr::filter(label.x == label.y) %>%
        dplyr::select(FID = FID.x, 
                      label = label.x) %>%
        return()
}




#---- Script ----

# Build a table of metadata.
s2cloud_tb <- file.path(base_dir, 
                        "data", 
                        "copernicus-sentinel-2-scenes") %>%
    find_masks(mask_pattern = "._s2cloudless_mask[.]tif$") %>%
    dplyr::rename(s2cloudless = "mask_file") %>% 
    ensurer::ensure_that(nrow(.) == 20,
                         err_desc = "There are missing masks!")

cloud_mask_tb <- s2cloud_tb %>%
    dplyr::mutate(s2cloudless_r = purrr::map(s2cloudless, 
                                             raster::raster)) %>%
    dplyr::select(-c(mission, orbit, s2cloudless))

# Second classification made by experts.
second_classification <- file.path(base_dir, 
                                   "data", 
                                   "samples",
                                   "point_second_classification") %>%
    get_sample_shps() %>%
    dplyr::rename(file_path_2 = file_path) %>% 
    ensurer::ensure_that(nrow(.) == 20,
                         err_desc = "There are missing point shapefiles!")
    
# Read the sample points classified by experts.
cloud_experts <- file.path(base_dir, 
                           "data", 
                           "samples", 
                           "point") %>%
    get_sample_shps() %>%
    dplyr::filter((mission == "S2A" & tile == "T19LFK" & img_date %in% c("20161004T144732", "20170102T144722", "20180507T144731", "20181103T144731")) |
                  (mission == "S2A" & tile == "T20NPH" & img_date %in% c("20160901T143752", "20161110T143752", "20170218T143751", "20170718T143751")) |
                  (mission == "S2A" & tile == "T21LXH" & img_date %in% c("20170328T140051", "20180611T140051", "20180919T140051", "20181009T140051")) |
                  (mission == "S2A" & tile == "T22MCA" & img_date %in% c("20170603T135111", "20170623T135111", "20180419T135111", "20180628T135111")) |
                  (mission == "S2A" & tile == "T22NCG" & img_date %in% c("20160929T140052", "20161019T140052", "20170527T140101", "20170706T140051"))) %>%
    dplyr::left_join(second_classification,
                     by = c("mission", "level", "tile", "img_date")) %>%
    ensurer::ensure_that(nrow(.) == 20,
                         err_desc = "Wrong number of shapefiles!") %>%
    dplyr::mutate(samples_sf_1 = purrr::map(file_path,   
                                            read_samples),
                  samples_sf_2 = purrr::map(file_path_2, 
                                            read_samples)) %>%
    dplyr::mutate(samples_sf = purrr::map2(samples_sf_1, 
                                           samples_sf_2,
                                           join_samples)) %>%
    dplyr::mutate(n_samples   = purrr::map_int(samples_sf,   nrow),
                  n_samples_1 = purrr::map_int(samples_sf_1, nrow),
                  n_samples_2 = purrr::map_int(samples_sf_2, nrow))

cloud_experts <- cloud_experts %>%
    dplyr::mutate(srs = purrr::map(samples_sf, sf::st_crs)) %>%
    dplyr::inner_join(cloud_mask_tb, by = c("tile", "img_date")) %>%
    ensurer::ensure_that(nrow(.) == 20,
                         err_desc = "Wrong number of cloud masks!") %>%
    dplyr::mutate(s2cloud_sf = purrr::map2(samples_sf, 
                                           s2cloudless_r,
                                           purrr::possibly(get_label_raster, 
                                                           NA),
                                           new_col = s2cloudless)) %>%
    ensurer::ensure_that(all(!vapply(.$s2cloud_sf, tibble::is_tibble, 
                                     logical(1))),
                         err_desc = paste("Failed to get samples",
                                          "labels from cloud masks!")) %>%
    dplyr::mutate(samples_sf = purrr::pmap(dplyr::select(., 
                                                         samples_sf, 
                                                         s2cloud_sf),
                   function(samples_sf, s2cloud_sf){
                       samples_sf %>%
                           dplyr::bind_cols(sf::st_set_geometry(s2cloud_sf, 
                                                                NULL)) %>%
                           return()
                   })) %>%
    # Recode.
    dplyr::mutate(samples_sf = purrr::map(samples_sf, 
                                          recode_sf_s2cloudless, 
                                          coded_var = s2cloudless)) %>%
    # Compute the frequency of each class in each image.
    dplyr::mutate(s2cloudless_freq = purrr::map(s2cloudless_r, 
                                                purrr::possibly(get_raster_freq, 
                                                                NA), 
                                                detector = s2cloudless)) %>%
    ensurer::ensure_that(all(!vapply(.$s2cloudless_r, 
                                     tibble::is_tibble, logical(1))),
                         err_desc = paste("Failed to get label", 
                                          "frequencies from cloud masks!"))

recode_vec <- c("cirrus" = "cloud",
                "clear"  = "clear",
                "cloud"  = "cloud",
                "shadow" = "shadow")

data_tb <- cloud_experts %>%
    dplyr::select(mission, level, tile, img_date, samples_sf) %>%
    dplyr::mutate(samples_tb = purrr::map(samples_sf, 
                                          sf::st_set_geometry,
                                          value = NULL)) %>%
    dplyr::select(-samples_sf) %>%
    tidyr::unnest(cols = c(samples_tb)) %>%
    dplyr::select(-FID) %>%
    tidyr::drop_na() %>%
    tibble::as_tibble() %>%
    dplyr::mutate(Label       = dplyr::recode(label,       !!!recode_vec),
                  s2cloudless = dplyr::recode(s2cloudless, !!!recode_vec)) %>%
    dplyr::select(mission, level, tile, img_date, Label, s2cloudless) %>%
    ensurer::ensure_that(all(!is.na(.$Label)),
                         all(!is.na(.$s2cloudless)),
                         err_desc = "NAs found in analysis data!")



format_conmat2 <- function(.data, ...){

    s2cloud_acc <- .data %>%
        get_confusion_matrix(prediction_var = s2cloudless, reference_var = Label) %>%
        magrittr::extract2("table") %>%
        asses_accuracy_simple() %>%
        magrittr::set_names(c(names(.)[1], paste0("s2cloudless_", names(.)[-1])))

    return(s2cloud_acc)
}


print("Total accuracy.")
data_tb %>%
    format_conmat2() #%>%
#     (function(x){print(x, n = Inf); invisible(x)}) %>%
#     readr::write_csv(file = file.path(base_dir, "results", "results_response.csv"))
# 
# data_tb %>%
#     saveRDS(file = file.path(base_dir, "results", "data_response.rds"))


data_tb %>%
    dplyr::arrange(mission, level, tile, img_date) %>%
    dplyr::group_by(mission, level, tile) %>%
    dplyr::group_modify(.f = format_conmat2) %>%
    print(n = Inf)
    

