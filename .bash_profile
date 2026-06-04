#
# ~/.bash_profile
#

export MPD_HOST=$XDG_RUNTIME_DIR/mpd.sock
export EDITOR=nvim
export PATH="~/.local/bin:~/.cargo/bin:~/.bun/bun:$PATH"

[[ -f ~/.bashrc ]] && . ~/.bashrc
