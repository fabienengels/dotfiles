#
# ~/.bash_profile
#

export MPD_HOST=$XDG_RUNTIME_DIR/mpd.sock
export EDITOR=nvim
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.bun/bin:$PATH"

[[ -f ~/.bashrc ]] && . ~/.bashrc
