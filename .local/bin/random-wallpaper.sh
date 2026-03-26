#!/usr/bin/env bash

for i in $(find ~/Sync/Pictures/Wallpapers -type f | shuf); do
  echo $i
  awww img $i
  # matugen image --show-colors $i
  matugen image --prefer saturation --show-colors --contrast 1 $i
  break
done
