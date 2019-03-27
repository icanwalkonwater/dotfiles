# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=2

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  colored-man-pages
  ant
  gitignore
  repo
  node
  npm
  composer
  laravel
  pip
  python
  pyenv
  virtualenv
  archlinux
  lol
  sublime
)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"


# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='subl3'
else
   export EDITOR='nano'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# GPG TTY
# For signing commit (wtf ?)
export GPG_TTY=$(tty)

# export TERM="xterm-256color"

# Load oh-my-zsh
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Wal colors
(cat ~/.cache/wal/sequences &)

# Other Completion
kitty + complete setup zsh | source /dev/stdin

# Setup spaceship
autoload -U promptinit; promptinit
prompt spaceship

SPACESHIP_PROMPT_ORDER=(
  #time
  exit_code
  jobs
  user
  host
  dir
  git
  #hg
  #package
  node
  #ruby
  #elixir
  #xcode
  #swift
  #golang
  php
  #rust
  #haskell
  #julia
  #docker
  #aws
  venv
  #conda
  #pyenv
  #dotnet
  #ember
  #kubecontext
  #terraform
  exec_time
  #battery
  #vi_mode
  char
)

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false

# Char settings
SPACESHIP_CHAR_PREFIX=''
SPACESHIP_CHAR_SUFFIX=' '
SPACESHIP_CHAR_SYMBOL=◆
SPACESHIP_CHAR_SYMBOL_ROOT=

# User/host settings
SPACESHIP_USER_SHOW=always
SPACESHIP_USER_PREFIX=''
SPACESHIP_USER_SUFFIX=''
SPACESHIP_HOST_SHOW=always
SPACESHIP_HOST_PREFIX=@

# DIr settings
SPACESHIP_DIR_PREFIX=''
SPACESHIP_DIR_TRUNC=15
SPACESHIP_DIR_TRUC_PREFIX='[...]/'
SPACESHIP_DIR_TRUNC_REPO=false

# Git settings
SPACESHIP_GIT_PREFIX=''
SPACESHIP_GIT_STATUS_PREFIX=' '
SPACESHIP_GIT_STATUS_SUFFIX=''

# Virtualenv
SPACESHIP_VENV_PREFIX=''
SPACESHIP_VENV_SYMBOL=' '

# Node.JS
SPACESHIP_NODE_PREFIX=''
SPACESHIP_NODE_SYMBOL=' '

# PHP
SPACESHIP_PHP_PREFIX=''
SPACESHIP_PHP_SYMBOL=' '

# Exec time and exit code settings
SPACESHIP_EXEC_TIME_PREFIX=''
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_EXIT_CODE_SYMBOL=''

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias js=js52
alias qemu=qemu-system-x86_64
alias zshconfig="st ~/.zshrc"
alias sshvps="ssh root@vps.local"
alias cat=ccat
alias import="import \"$HOME/Images/Screenshot_$(date +%s_%N)"

# Fortune
echo
fortune -as
echo
