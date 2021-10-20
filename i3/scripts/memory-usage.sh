#!/usr/bin/env sh

set -eu

value=$(awk '/MemTotal/ {memtotal=$2}; /MemAvailable/ {memavail=$2}; END { printf("%.0f", (memtotal - memavail) / memtotal * 100) }' /proc/meminfo)

echo "$value%"
echo "$value%"

if [ $value -ge 80 ]
then
  echo "#CD0000"
  exit 33
elif [ $value -ge 50 ]
then
  echo "#CDCD00"
fi
