#!/bin/bash

# Credentials for downloading Sentinel images

export MY_USER=""
export MY_PWD=""
export dhusget="/home/alber-d006/bin/dhusget.sh"
export out="/home/alber-d006/Documents/github/clouds/data/copernicus-sentinel-2-scenes"
-O "$out"

# T19LFK
"${dhusget}" -u "${MY_USER}" -p "${MY_PWD}" -m Sentinel-2 -i MSI -T S2MSI1C -S 2016-10-04T00:00:00Z -E 2016-10-04T23:59:59Z -c -67.5924078,-9.5159409:-67.5924077,-9.5159408 -o all -O "$out"
"${dhusget}" -u "${MY_USER}" -p "${MY_PWD}" -m Sentinel-2 -i MSI -T S2MSI1C -S 2017-01-02T00:00:00Z -E 2017-01-02T23:59:59Z -c -67.5924078,-9.5159409:-67.5924077,-9.5159408 -o all -O "$out"
"${dhusget}" -u "${MY_USER}" -p "${MY_PWD}" -m Sentinel-2 -i MSI -T S2MSI1C -S 2018-05-07T00:00:00Z -E 2018-05-07T23:59:59Z -c -67.5924078,-9.5159409:-67.5924077,-9.5159408 -o all -O "$out"
"${dhusget}" -u "${MY_USER}" -p "${MY_PWD}" -m Sentinel-2 -i MSI -T S2MSI1C -S 2018-11-03T03:00:00Z -E 2018-11-03T23:59:59Z -c -67.5924078,-9.5159409:-67.5924077,-9.5159408 -o all -O "$out"
# T20NPH
"${dhusget}" -u "${MY_USER}" -p "${MY_PWD}" -m Sentinel-2 -i MSI -T S2MSI1C -S 2016-09-01T00:00:00Z -E 2016-09-01T23:59:59Z -c -61.583018037,2.259797170:-61.583018036,2.259797160 -o all -O "$out"
"${dhusget}" -u "${MY_USER}" -p "${MY_PWD}" -m Sentinel-2 -i MSI -T S2MSI1C -S 2016-11-10T00:00:00Z -E 2016-11-10T23:59:59Z -c -61.583018037,2.259797170:-61.583018036,2.259797160 -o all -O "$out"
"${dhusget}" -u "${MY_USER}" -p "${MY_PWD}" -m Sentinel-2 -i MSI -T S2MSI1C -S 2017-02-18T00:00:00Z -E 2017-02-18T23:59:59Z -c -61.583018037,2.259797170:-61.583018036,2.259797160 -o all -O "$out"
"${dhusget}" -u "${MY_USER}" -p "${MY_PWD}" -m Sentinel-2 -i MSI -T S2MSI1C -S 2017-07-18T00:00:00Z -E 2017-07-18T23:59:59Z -c -61.583018037,2.259797170:-61.583018036,2.259797160 -o all -O "$out"
# T21LXH
"${dhusget}" -u "${MY_USER}" -p "${MY_PWD}" -m Sentinel-2 -i MSI -T S2MSI1C -S 2017-03-28T00:00:00Z -E 2017-03-28T23:59:59Z -c -55.58260600,-11.34540387:-55.58260500,-11.34540386 -o all -O "$out"
"${dhusget}" -u "${MY_USER}" -p "${MY_PWD}" -m Sentinel-2 -i MSI -T S2MSI1C -S 2018-06-11T00:00:00Z -E 2018-06-11T23:59:59Z -c -55.58260600,-11.34540387:-55.58260500,-11.34540386 -o all -O "$out"
"${dhusget}" -u "${MY_USER}" -p "${MY_PWD}" -m Sentinel-2 -i MSI -T S2MSI1C -S 2018-09-19T00:00:00Z -E 2018-09-19T23:59:59Z -c -55.58260600,-11.34540387:-55.58260500,-11.34540386 -o all -O "$out"
"${dhusget}" -u "${MY_USER}" -p "${MY_PWD}" -m Sentinel-2 -i MSI -T S2MSI1C -S 2018-10-09T00:00:00Z -E 2018-10-09T23:59:59Z -c -55.58260600,-11.34540387:-55.58260500,-11.34540386 -o all -O "$out"
# T22MCA
"${dhusget}" -u "${MY_USER}" -p "${MY_PWD}" -m Sentinel-2 -i MSI -T S2MSI1C -S 2017-06-03T00:00:00Z -E 2017-06-03T23:59:59Z -c -52.314502770,-4.097274585:-52.314502760,-4.097274584 -o all -O "$out"
"${dhusget}" -u "${MY_USER}" -p "${MY_PWD}" -m Sentinel-2 -i MSI -T S2MSI1C -S 2017-06-23T00:00:00Z -E 2017-06-23T23:59:59Z -c -52.314502770,-4.097274585:-52.314502760,-4.097274584 -o all -O "$out"
"${dhusget}" -u "${MY_USER}" -p "${MY_PWD}" -m Sentinel-2 -i MSI -T S2MSI1C -S 2018-04-19T00:00:00Z -E 2018-04-19T23:59:59Z -c -52.314502770,-4.097274585:-52.314502760,-4.097274584 -o all -O "$out"
"${dhusget}" -u "${MY_USER}" -p "${MY_PWD}" -m Sentinel-2 -i MSI -T S2MSI1C -S 2018-06-28T00:00:00Z -E 2018-06-28T23:59:59Z -c -52.314502770,-4.097274585:-52.314502760,-4.097274584 -o all -O "$out"
# T22NCG
"${dhusget}" -u "${MY_USER}" -p "${MY_PWD}" -m Sentinel-2 -i MSI -T S2MSI1C -S 2016-09-29T00:00:00Z -E 2016-09-29T23:59:59Z -c -52.2671867670,1.3426332347:-52.2671867660,1.3426332346 -o all -O "$out"
"${dhusget}" -u "${MY_USER}" -p "${MY_PWD}" -m Sentinel-2 -i MSI -T S2MSI1C -S 2016-10-19T00:00:00Z -E 2016-10-19T23:59:59Z -c -52.2671867670,1.3426332347:-52.2671867660,1.3426332346 -o all -O "$out"
"${dhusget}" -u "${MY_USER}" -p "${MY_PWD}" -m Sentinel-2 -i MSI -T S2MSI1C -S 2017-05-27T00:00:00Z -E 2017-05-27T23:59:59Z -c -52.2671867670,1.3426332347:-52.2671867660,1.3426332346 -o all -O "$out"
"${dhusget}" -u "${MY_USER}" -p "${MY_PWD}" -m Sentinel-2 -i MSI -T S2MSI1C -S 2017-07-06T00:00:00Z -E 2017-07-06T23:59:59Z -c -52.2671867670,1.3426332347:-52.2671867660,1.3426332346 -o all -O "$out"

exit 0
