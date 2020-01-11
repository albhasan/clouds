#!/bin/bash

# copy the images ran by Renan (sen2cor)

rsync -avz -e ssh alber@150.163.2.38:/gfs/Alber /home/alber/Documents/data/experiments/prodes_reproduction/papers/clouds/data/sen2cor/S2SR

