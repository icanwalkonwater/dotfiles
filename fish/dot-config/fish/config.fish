if status is-interactive
    # Commands to run in interactive sessions can go here

    # Prompt
    starship init fish | source
end

set -x EDITOR nvim

alias l='ls -alh'
