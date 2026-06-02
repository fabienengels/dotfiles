#!/usr/bin/env nu

let path = awww query --json
           | from json
           | get ""
           | get displaying.image
           | first

rm -v $path

random-wallpaper.nu
