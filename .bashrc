# Drop back to fish
# (https://wiki.archlinux.org/title/fish#Modify_.bashrc_to_drop_into_fish)
if [ -z "$BASH_EXECUTION_STRING" ]; then
  exec fish
fi
