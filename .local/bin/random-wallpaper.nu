#!/usr/bin/env nu

let wallpaper = (
    ls ~/Sync/Pictures/Wallpapers/* | where type == file
    | get name
    | shuffle
    | first 
)

awww img $wallpaper
matugen image --prefer saturation --show-colors --contrast 1 $wallpaper
print $wallpaper
