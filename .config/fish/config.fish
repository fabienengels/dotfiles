set -U fish_greeting

# TODO
# https://gist.github.com/StringKe/4634f44b6a7ac61030cc17b9d6ce85b7
# ex : type -q atuin

# fish_vi_key_bindings

fish_add_path -p ~/.local/bin ~/.cargo/bin ~/.bun/bin ~/.bun/bin ~/go/bin

starship init fish | source
zoxide init fish | source
atuin init fish --disable-up-arrow | source
# flux completion fish | source

# if test -f '/usr/share/fish/vendor_completions.d/kubectl.fish'
#     source /usr/share/fish/vendor_completions.d/kubectl.fish
# end

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
alias groot="cd (git root)"
alias switch-cluster="export KUBECONFIG=(fd -e yaml . ~/.kubeconfig | fzf)"
alias mcat="mcat --theme catppuccin"
alias j="just"

alias niri-windows='niri msg -j windows | jq .'

alias upgrade-opencode="bun add -g opencode-ai"

alias rust-book="rustup doc --book"

alias k="kubectl"
alias kns="kubectl config set-context --current --namespace"
alias unset-context="kubectl config unset current-context"

alias l="eza -l --icons --group-directories-first --git"

alias yt="yt-dlp --cookies-from-browser firefox --embed-thumbnail --embed-chapters"
alias s2c="slurp | grim -g - - | wl-copy"

function pr-worktree
    git fetch -v origin pull/$argv/head:pr-$argv
    set worktree "../$(path basename (pwd))-pr$argv"
    if test ! -d $worktree
        git worktree add $worktree pr-$argv
    else
        echo "Worktree $worktree already exists"
    end
end

function pr-delete
    set worktree "../$(path basename (pwd))-pr$argv"
    if test -d $worktree
        git worktree remove $worktree
    end
    git branch -D pr-$argv
end

function man
    /usr/bin/man $argv | bat -l man -p
end

fish_config theme choose base16-default

if test -z "$SSH_AUTH_SOCK"
    export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
end
