#!/bin/bash
# QUERY SENTINEL IMAGES FROM ESA. 
# These 2A images are already masked

sentinelsat -u alber.ipia -p BIGdatalab360se --name S2A_MSIL1C_20180626T144731_N0206_R139_T19LFK_20180626T181304 -d
sentinelsat -u alber.ipia -p BIGdatalab360se --name S2A_MSIL1C_20180825T144731_N0206_R139_T19LFK_20180825T183824 -d
sentinelsat -u alber.ipia -p BIGdatalab360se --name S2A_MSIL1C_20190422T144731_N0207_R139_T19LFK_20190422T193355 -d
sentinelsat -u alber.ipia -p BIGdatalab360se --name S2B_MSIL1C_20180313T144719_N0206_R139_T19LFK_20180313T181249 -d

#mv S2A_MSIL1C_20180626T144731_N0206_R139_T19LFK_20180626T181304* L1C
#cd L1C/S2A_MSIL1C_20180626T144731_N0206_R139_T19LFK_20180626T181304*
#fmask.sh

