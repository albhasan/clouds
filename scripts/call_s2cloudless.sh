#!/bin/bash

in_dir="/home/alber-d006/Documents/github/clouds/data/copernicus-sentinel-2-scenes"
script="/home/alber-d006/Documents/github/clouds/python/call_s2cloudless.py"

${script} --in_dir ${in_dir}

exit 0