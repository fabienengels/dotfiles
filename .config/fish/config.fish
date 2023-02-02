source ~/.config/fish/key-bindings.fish

set -U fish_greeting

switch (uname)
  case Darwin
    fish_add_path -p /opt/homebrew/bin
end

fish_add_path -p ~/.local/bin ~/.cargo/bin

starship init fish | source
zoxide init fish | source

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

alias l="exa --long --icons --group-directories-first --sort extension --git"
alias a="l -a"

alias bt_on="echo 'power on' | bluetoothctl && sleep 1 && echo 'power on' | bluetoothctl"
alias bt_off="echo 'power off' | bluetoothctl"

set fish_color_autosuggestion green
set fish_color_command blue
set fish_color_match green
