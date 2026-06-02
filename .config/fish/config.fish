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

fish_config theme choose base16-default

if test -z "$SSH_AUTH_SOCK"
    export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
end
