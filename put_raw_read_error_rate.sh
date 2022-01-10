#!/bin/bash
devices=("/dev/sda" "/dev/sdb" "/dev/sdc" "/dev/sdd" "/dev/sde" "/dev/sdf")

for device in ${devices[@]}
do
  raw_read_error_rate=`smartctl -a -d ata ${devices[$i]} | grep "Raw_Read_Error_Rate" | awk '{ print $10}'`
  aws cloudwatch put-metric-data --metric-name Raw_Read_Error_Rate --namespace SMART --value raw_read_error_rate --dimensions DeviceName=${devices[$i]},HostName=$HOSTNAME
done
