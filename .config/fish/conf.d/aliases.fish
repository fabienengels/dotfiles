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
# Switch cluster
alias sc="export KUBECONFIG=(fd -e yaml . ~/.kube | fzf)"
alias aur-packages="paru -Qm"
alias niri-windows='niri msg -j windows | jq .'
alias rust-book="rustup doc --book"
alias l="eza -l --icons --group-directories-first --git"
alias yt="yt-dlp --cookies-from-browser firefox --embed-thumbnail --embed-chapters"
alias s2c="slurp | grim -g - - | wl-copy"

# Create hx alias when using Arch
command -q hx || alias hx=helix
