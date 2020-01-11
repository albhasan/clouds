#!/bin/bash

# CUT THE MASKS TO MATCH THE SAMPLE IMAGES.

MASK_URBAN="/home/alber/Documents/data/experiments/prodes_reproduction/papers/clouds/data/masks/urban"
MASK_WATER="/home/alber/Documents/data/experiments/prodes_reproduction/papers/clouds/data/masks/water"

ext_t19lfk="'600000.000 8890240.000 709800.000 9000040.000'" # EPSG:32719
ext_t21lxh="'600000.000 8690200.000 709800.000 8800000.000'" # EPSG:32721
ext_t22mca="'300000.000 9490240.000 409800.000 9600040.000'" # EPSG:32722

rm "$MASK_WATER/tiled/extent_t19lfk.tif"
rm "$MASK_WATER/tiled/extent_t21lxh.tif"
rm "$MASK_WATER/tiled/extent_t22mca.tif"
rm "$MASK_URBAN/tiled/USO_urb_t19lfk.tif"
rm "$MASK_URBAN/tiled/USO_urb_t21lxh.tif"
rm "$MASK_URBAN/tiled/USO_urb_t22mca.tif"

gdalwarp -te $ext_t19lfk -te_srs EPSG:32719 "$MASK_WATER/extent_70W_0N.tif"  "$MASK_WATER/tiled/extent_t19lfk.tif"
gdalwarp -te $ext_t21lxh -te_srs EPSG:32721 "$MASK_WATER/extent_60W_10S.tif" "$MASK_WATER/tiled/extent_t21lxh.tif"
gdalwarp -te $ext_t22mca -te_srs EPSG:32722 "$MASK_WATER/extent_60W_0N.tif"  "$MASK_WATER/tiled/extent_t22mca.tif"

gdalwarp -te $ext_t19lfk -te_srs EPSG:32719 "$MASK_URBAN/USO_urb.tif"        "$MASK_URBAN/tiled/USO_urb_t19lfk.tif"
gdalwarp -te $ext_t21lxh -te_srs EPSG:32721 "$MASK_URBAN/USO_urb.tif"        "$MASK_URBAN/tiled/USO_urb_t21lxh.tif"
gdalwarp -te $ext_t22mca -te_srs EPSG:32722 "$MASK_URBAN/USO_urb.tif"        "$MASK_URBAN/tiled/USO_urb_t22mca.tif"

