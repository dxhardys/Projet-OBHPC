#!/bin/bash

echo "-------------------------------Architecture CPU-----------------------------------" > cpuinfo.txt
lscpu >> cpuinfo.txt

echo "-------------------------------CPU info-------------------------------------------" >>cpuinfo.txt
cat /proc/cpuinfo >> cpuinfo.txt


echo "-------------------------------Cache Info-----------------------------------------" >cacheinfo.txt
echo "//Cache L1 Data" >>cacheinfo.txt

cat /sys/devices/system/cpu/cpu0/cache/index0/* >> cacheinfo.txt

echo "//Cache L1 Instruction" >>cacheinfo.txt
cat /sys/devices/system/cpu/cpu0/cache/index1/* >> cacheinfo.txt


echo "//Cache L2" >>cacheinfo.txt
cat /sys/devices/system/cpu/cpu0/cache/index2/* >> cacheinfo.txt

echo "//Cache L3" >>cacheinfo.txt
cat /sys/devices/system/cpu/cpu0/cache/index3/* >> cacheinfo.txt

echo "---------------------------Desktop Manager Interface Infos-------------------------"> DMInterface.txt
sudo dmidecode >> DMInterface.txt

