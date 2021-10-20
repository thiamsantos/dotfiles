#!/usr/bin/env sh

set -eu

cpu_usage=$(mpstat 1 1 -o JSON | jq '.sysstat.hosts[0].statistics[0]."cpu-load"[0] as $value | 100 - $value.idle')

formated_value=$(printf "%0.2f" $cpu_usage)

echo "$formated_value%"
echo "$formated_value%"

if [ "$(echo "${cpu_usage} > 80" | bc)" -eq 1 ]
then
  echo "#CD0000"
  exit 33
elif [ "$(echo "${cpu_usage} > 50" | bc)" -eq 1 ]
then
  echo "#CDCD00"
fi
