#!/bin/bash

# COPY THE IMAGES PROCESSED USING MAJA TO THE DESTINATION DIRECTORY.

maja_dir="/home/alber/Documents/data/experiments/prodes_reproduction/papers/clouds/data/maja"
sen2agri_1="/home/scidb/sen2agri/archive/maccs_def"
sen2agri_2="/home/scidb/sen2agri_2/archive/maccs_def"

# T19LFK
cp -r $sen2agri_1/hls_19lfk/l2a/S2A_MSIL2A_20161004T144732_N0204_R139_T19LFK_20161004T144903.SAFE $maja_dir       
cp -r $sen2agri_1/hls_19lfk/l2a/S2A_MSIL2A_20170102T144722_N0204_R139_T19LFK_20170102T144743.SAFE $maja_dir       
cp -r $sen2agri_1/hls_19lfk/l2a/S2A_MSIL2A_20180507T144731_N0206_R139_T19LFK_20180507T182218.SAFE $maja_dir       
cp -r $sen2agri_1/hls_19lfk/l2a/S2A_MSIL2A_20181103T144731_N0206_R139_T19LFK_20181103T163457.SAFE $maja_dir       
# T20NPH
cp -r $sen2agri_1/s2_20nph/l2a/S2A_MSIL2A_20160901T143752_N0204_R096_T20NPH_20160901T143746.SAFE  $maja_dir
cp -r $sen2agri_1/s2_20nph/l2a/S2A_MSIL2A_20161110T143752_N0204_R096_T20NPH_20161110T143750.SAFE  $maja_dir
cp -r $sen2agri_1/s2_20nph/l2a/S2A_MSIL2A_20170218T143751_N0204_R096_T20NPH_20170218T143931.SAFE  $maja_dir
cp -r $sen2agri_1/s2_20nph/l2a/S2A_MSIL2A_20170718T143751_N0205_R096_T20NPH_20170718T143752.SAFE  $maja_dir
# T21LXH
cp -r $sen2agri_2/hls_21lxh/l2a/S2A_MSIL2A_20170328T140051_N0204_R067_T21LXH_20170328T140141.SAFE $maja_dir
cp -r $sen2agri_2/hls_21lxh/l2a/S2A_MSIL2A_20180611T140051_N0206_R067_T21LXH_20180611T154709.SAFE $maja_dir
cp -r $sen2agri_2/hls_21lxh/l2a/S2A_MSIL2A_20180919T140051_N0206_R067_T21LXH_20180919T174008.SAFE $maja_dir
cp -r $sen2agri_2/hls_21lxh/l2a/S2A_MSIL2A_20181009T140051_N0206_R067_T21LXH_20181009T173159.SAFE $maja_dir
# T22MCA
cp -r $sen2agri_2/s2_22mca/l2a/S2A_MSIL2A_20170603T135111_N0205_R024_T22MCA_20170603T135143.SAFE  $maja_dir
cp -r $sen2agri_2/s2_22mca/l2a/S2A_MSIL2A_20170623T135111_N0205_R024_T22MCA_20170623T135111.SAFE  $maja_dir
cp -r $sen2agri_2/s2_22mca/l2a/S2A_MSIL2A_20180419T135111_N0206_R024_T22MCA_20180419T153418.SAFE  $maja_dir
cp -r $sen2agri_2/s2_22mca/l2a/S2A_MSIL2A_20180628T135111_N0206_R024_T22MCA_20180628T153546.SAFE  $maja_dir
#T22NCG
cp -r $sen2agri_1/s2_22ncg/l2a/S2A_MSIL2A_20160929T140052_N0204_R067_T22NCG_20160929T140047.SAFE  $maja_dir 
cp -r $sen2agri_1/s2_22ncg/l2a/S2A_MSIL2A_20161019T140052_N0204_R067_T22NCG_20161019T140047.SAFE  $maja_dir
cp -r $sen2agri_1/s2_22ncg/l2a/S2A_MSIL2A_20170527T140101_N0205_R067_T22NCG_20170527T140055.SAFE  $maja_dir
cp -r $sen2agri_1/s2_22ncg/l2a/S2A_MSIL2A_20170706T140051_N0205_R067_T22NCG_20170706T140051.SAFE  $maja_dir

