#/bin/bash

# copy sentinel 2 images

rsync -avzh alber@150.163.2.206:/home/alber/Documents/data/experiments/prodes_reproduction/papers/clouds/data/fmask4_s2cloudless/ /home/alber/Documents/ghProjects/sentinel2-cloud-detector/alber_test/images/

exit 0
