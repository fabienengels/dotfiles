# Update paths
export PATH="/opt/homebrew/bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.yarn/bin:$PATH"

# Elixir IEx settings
export ERL_AFLAGS="-kernel shell_history enabled -kernel shell_history_file_bytes 1024000"

# Default editor
export EDITOR="nvim"

# Man
export MANPAGER="nvim +Man!"
export MANWIDTH=999

# Disable warning when using bash under MacOS
export BASH_SILENCE_DEPRECATION_WARNING=1

# FZF
export FZF_DEFAULT_COMMAND="rg --files"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
    --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54'

# Wayland
export XDG_SESSION_TYPE=wayland
export GDK_BACKEND=wayland
export MOZ_ENABLE_WAYLAND=1
export WLR_DRM_NO_MODIFIERS=1

# Set keyboard layout
export XKB_DEFAULT_VARIANT='altgr-intl'

# Make fish the default shell in interactive session
if [ -z "$BASH_EXECUTION_STRING" ]; then
  exec fish
fi
