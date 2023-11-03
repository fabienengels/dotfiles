set -U fish_greeting

switch (uname)
  case Darwin
    fish_add_path -p /opt/homebrew/bin
    # fish_add_path -p $HOME/.rd/bin
    fish_add_path -p /usr/local/bin
end

fish_add_path -p ~/.local/bin ~/.cargo/bin ~/.bun/bin

starship init fish | source
zoxide init fish | source
atuin init fish --disable-up-arrow | source

alias vi="nvim"
alias g="git"
alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias d="dotfiles"
alias icat="kitty +kitten icat"
alias deletedsstore="fd -H '.DS_Store' $HOME -X rm -fv {}"
alias deletesyncconflict="fd -H sync-conflict- . -X rm -vf {}"
alias music-player="ncmpcpp"
alias groot="cd (git root)"

alias k="kubectl"
alias kns="kubectl config set-context --current --namespace"

alias l="eza --long --icons --group-directories-first --sort extension --git"
alias a="l -a"

alias bt_on="echo 'power on' | bluetoothctl && sleep 1 && echo 'power on' | bluetoothctl"
alias bt_off="echo 'power off' | bluetoothctl"

source ~/.config/fish/themes/kanagawa.fish

# set fish_color_autosuggestion green
set fish_color_command blue
# set fish_color_match green
