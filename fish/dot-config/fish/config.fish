if status is-interactive
    # Commands to run in interactive sessions can go here

    # Prompt
    starship init fish | source
end

# Remove greeting
set fish_greeting

# Set editor
set -x EDITOR nvim

# Aliases
alias l='ls -alh'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
