# Drop back to fish
# (https://wiki.archlinux.org/title/fish#Modify_.bashrc_to_drop_into_fish)
if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} ]]; then
  exec fish
fi
