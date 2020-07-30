#!/bin/bash

Rscript compare_results.R /home/alber/Documents/data/experiments/prodes_reproduction/papers/clouds/data/fmask4_s2cloudless
Rscript compare_results.R /home/alber/Documents/data/experiments/prodes_reproduction/papers/clouds/data/s2cloudless_test/machine_docker
Rscript compare_results.R /home/alber/Documents/data/experiments/prodes_reproduction/papers/clouds/data/s2cloudless_test/machine_paper

exit 0
