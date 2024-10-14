#!/usr/bin/env bash

for i in $(find ~/Sync/Pictures/Wallpapers -type f | shuf); do
  swww img $i && echo $i && break
done
