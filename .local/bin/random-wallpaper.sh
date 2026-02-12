#!/usr/bin/env bash

for i in $(find ~/Sync/Pictures/Wallpapers -type f | shuf); do
  echo $i
  awww img $i
  matugen image --show-colors $i
  break
done
