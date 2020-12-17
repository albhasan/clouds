#-------------------------------------------------------------------------------
# Prepare a Docker Images for running s2cloudless
#-------------------------------------------------------------------------------
# Compile:
# docker build -t s2cloudless /net/150.163.2.206/disks/d6/shared/alber/prodes_reproduction/papers/clouds/data/docker/s2cloudless
#-------------------------------------------------------------------------------
# Run interactively:
# docker run -v /home/alber/Documents/data/experiments/prodes_reproduction/papers/clouds/data/test:/data -it  s2cloudless /bin/bash
#-------------------------------------------------------------------------------
# Run:
# docker run -v /home/alber/Documents/data/experiments/prodes_reproduction/papers/clouds/data/test:/data s2cloudless 
#-------------------------------------------------------------------------------
FROM osgeo/gdal 

RUN apt-get update && apt-get install -y \
    software-properties-common
RUN add-apt-repository universe
RUN apt-get update -y && apt-get install -y \
    python3-pip
ADD call_s2cloudless.py /
RUN pip3 install s2cloudless
RUN mkdir /data
CMD [ "python", "./call_s2cloudless.py", "--in_dir", "/data" ]

