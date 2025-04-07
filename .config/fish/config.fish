set -U fish_greeting

# fish_vi_key_bindings

switch (uname)
    case Darwin
        fish_add_path -p /opt/homebrew/bin
        fish_add_path -p /opt/homebrew/opt/rustup/bin
        # fish_add_path -p $HOME/.rd/bin
        fish_add_path -p /usr/local/bin
end

fish_add_path -p ~/.local/bin ~/.cargo/bin ~/.bun/bin ~/.nix-profile/bin

direnv hook fish | source
starship init fish | source
zoxide init fish | source
atuin init fish --disable-up-arrow | source
poetry completions fish | source

if test -f '/usr/share/fish/vendor_completions.d/kubectl.fish'
    source /usr/share/fish/vendor_completions.d/kubectl.fish
end


# Create hx alias when using Arch
command -q hx || alias hx=helix

alias .="cd .."
alias ..="cd ../.."
alias ...="cd ../../.."

alias cd="z"
alias g="git"
alias lg="lazygit"
alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias dotfiles-lazygit="lazygit --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias d="dotfiles"
alias deletedsstore="fd -H '.DS_Store' $HOME -X rm -fv {}"
alias deletesyncconflict="fd -H sync-conflict- . -X rm -vf {}"
alias music-player="ncmpcpp"
alias groot="cd (git root)"
alias vim=nvim

alias rust-book="rustup doc --book"

alias k="kubectl"
alias kns="kubectl config set-context --current --namespace"

alias l="eza --icons --group-directories-first --sort extension --git"
alias a="l -a"

alias bt_on="echo 'power on' | bluetoothctl && sleep 1 && echo 'power on' | bluetoothctl"
alias bt_off="echo 'power off' | bluetoothctl"

alias yt="yt-dlp --cookies-from-browser firefox --embed-thumbnail --embed-chapters"

source ~/.config/fish/themes/kanagawa.fish

# set fish_color_autosuggestion green
set fish_color_command blue
# set fish_color_match green

if test -z "$SSH_AUTH_SOCK"
    export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
end

export EDITOR=hx
