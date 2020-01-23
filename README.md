# Clouds

Comparison of cloud algorithms on Sentinel-2 images.


## Algorithms

### fmask4
    * code https://github.com/gersl/fmask
    * description doi.org/10.1016/j.rse.2019.05.024
    * run: container in  scidb@e-sensing6
### maja
    * description https://www.mdpi.com/2072-4292/7/3/2668
    * run: use sen2agri instances on e-sensing6
### s2cloudless
    * desciption https://medium.com/sentinel-hub/improving-cloud-detection-with-machine-learning-c09dc5d7cf13
    * run: sdb-desktop installation with Sarah's script
### sen2cor
    * description https://www.spiedigitallibrary.org/conference-proceedings-of-spie/10427/2278218/Sen2Cor-for-Sentinel-2/10.1117/12.2278218.full 
    * run: Renana ran it


## Notes on running.

### Fmask 4

* use the docker container in e-sensing6: sudo docker run -it -v /home/alber/Documents/data/experiments/prodes_reproduction/papers/clouds/data/fmask4_s2cloudless:/root/images fmask:4.0 /bin/bash
* Call the script call_fmask.sh from inside the docker container.


### MAJA

* Copy the processed images from sen2agri's docker (instance running on e-sensing6).
* NOTE:
    + Images from tile 19LFK are in the sen2agri_1's directory.
    + 21LXH  and 22MCA are in the sen2agri_2's directory. 
* Copy the processed images using the script copy_maja_images.sh


### S2CLOUDLESS

* Run it from sdb-desktop
* Mount files 
* Use script create_s2cloudless_mask.py*
* Mount remote directory of images locally to run the algorithm sshfs alber@150.163.2.206:/net/150.163.2.206/disks/d6/shared/alber/prodes_reproduction/papers/clouds/data/fmask4 /home/alber/Documents/ghProjects/sentinel2-cloud-detector/alber_test/images


### SEN2COR

* Ask Renan Marujo to run on it on the images.
* ALTERNATIVE: Use https://github.com/lvhengani/sen2cor_docker.git but adapted to sen2cor 2.8.0 (which is running at sdb-desktop)
