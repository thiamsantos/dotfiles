#!/usr/bin/env sh

set -eu

value=$(awk '/SwapTotal/ {swaptotal=$2}; /SwapFree/ {swapfree=$2}; END { printf("%.0f", (swaptotal - swapfree) / swaptotal * 100) }' /proc/meminfo)

echo "$value%"
echo "$value%"

if [ $value -ge 25 ]
then
  echo "#CD0000"
  exit 33
elif [ $value -ge 5 ]
then
  echo "#CDCD00"
fi
