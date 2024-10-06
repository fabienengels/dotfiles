#!/bin/bash

while read -r name screen_ratio; do
  echo "$name $ratio"
  for i in $(find ~/Sync/Pictures/Wallpapers -type f | shuf); do
    # image_ratio=`expr $(identify $i | awk '{ print $3 }' | sed -e 's#x# / #')`
    # [ "$screen_ratio" -eq "$image_ratio" ] && swww img $i && echo $i && break
    swww img $i && echo $i && break
  done
done < <(hyprctl -j monitors | jq -r '.[] | "\(.name) \(.width / .height | floor)"')
