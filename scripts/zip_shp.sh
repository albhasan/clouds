#!/bin/bash

# zip shapefiles by name.

parallel zip {.}.zip {.}* ::: $(find . -type f -name "*shp")

