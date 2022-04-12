#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
[[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]] && source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# Customize to your needs...

# Example aliases
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

#===== User configuration =====

exist() {
  command -v $* > /dev/null
}

# Environmental Variables
unset PYTHONPATH
export VISUAL=nvim
export EDITOR=$VISUAL
export GO111MODULE=on
export GOPATH=$HOME
export LESS=-nqR
export MANPATH=/usr/local/man:$MANPATH
export NVM_DIR="$HOME/.nvm"
export PYENV_ROOT=$HOME/.pyenv
# Issue a EncodingWarning when the locale-specific default encoding is used
export PYTHONDEFAULTENCODING=1
export ZSH_HOME=$HOME/.zsh
if exist rustup && exist rustc; then
  local sysroot=$(rustc --print sysroot)
  if [[ ! -d "$sysroot" ]];then
    echo "Rust source code not found; installing..."
    rustup component add rust-src
  fi
  export RUST_SRC_PATH="$sysroot/lib/rustlib/src/rust/src"
fi

# enable Japanese input via SSH by setting the following environmental variables
# (ref: http://qiita.com/suin/items/629372fd08ee9e9cf727)
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# PATH
# set /usr/local/bin before /usr/bin
export PATH="/usr/local/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
# Make Homebrew's completions available
exist brew && FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"

# location to save command histories
export HISTFILE=${HOME}/.zsh_history
# number of histories saved in memory
export HISTSIZE=100000
# number of histories saved in file
export SAVEHIST=1000000
# ignore duplicate command
setopt hist_ignore_dups
# share history between screens
setopt share_history
# save each command's beginning timestamp and the duration to the history file
setopt extended_history
# remove old command if added one is same
setopt hist_ignore_all_dups
# remove command that starts with space from history
setopt hist_ignore_space
# don't execute the line directly
setopt hist_verify
# remove unnecessary whitespaces
setopt hist_reduce_blanks
# ignore commands already saved in history
setopt hist_save_no_dups
# don't save history command itself
setopt hist_no_store
# expand history automatically at completion
setopt hist_expand
# enable completion
rm -f "$HOME/.zcompdump"
fpath+=~/.zfunc
autoload -U compinit
compinit -C
# Disable start/stop control
stty -ixon
# remove duplicate entries in PATH
typeset -U path PATH
# Use Emacs key bindings
bindkey -e


#==============================
#  Aliases
#==============================
[[ -f "$HOME/.zsh_alias" ]] && source "$HOME/.zsh_alias"

#==============================
#  cdr
#==============================
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 5000
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both

#==============================
#  zaw
#==============================
[[ -s "${HOME}/.zsh/zaw/zaw.zsh" ]] && source "${HOME}/.zsh/zaw/zaw.zsh"

# enable case-insensitive
zstyle ':filter-select' case-insensitive yes
bindkey '^@' zaw
bindkey '^r' zaw-history
bindkey '^s' zaw-cdr
#bindkey '^o' zaw-open-file
bindkey '^j' zaw-applications
bindkey '^g' zaw-git-branches
bindkey '^o' zaw-git-status
bindkey '^z' zaw-git-files

#==============================
#  Gradle
#==============================
# Always run as daemon
export GRADLE_OPTS='-Dorg.gradle.daemon=true'

#==============================
#  zsh-notify
#==============================
# disable below because incompatible with Yosemite
#source ~/.zsh/zsh-notify/notify.plugin.zsh
#export SYS_NOTIFIER="/usr/local/bin/terminal-notifier"
#export NOTIFY_COMMAND_COMPLETE_TIMEOUT=10

#==============================
#  rbenv
#==============================
# Load rbenv if it exists
exist rbenv && eval "$(rbenv init -)"

#==============================
#  pyenv
#==============================
if exist pyenv; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

#==============================
#  direnv
#==============================
# Load direnv if it exists
exist direnv && eval "$(direnv hook zsh)"

#==============================
#  autojump
#==============================
if exist brew; then
  # Load autojump
  [[ -s $(brew --prefix)/etc/autojump.sh ]] && source $(brew --prefix)/etc/autojump.sh
  # remove 'jo' function for jo command
  unfunction jo
fi

#============================================================
#  Incremental completion on zsh
#  (http://mimosa-pudica.net/zsh-incremental.html)
#============================================================
#[[ -s "${ZSH_HOME}/incr/incr-0.2.zsh" ]] && source "${ZSH_HOME}/incr/incr-0.2.zsh"

#==============================
#  fzf
#==============================
#[[ -f $HOME/.fzf.zsh ]] && source $HOME/.fzf.zsh

#==============================
#  thefuck
#==============================
# Load thefuck if it exists
exist thefuck && eval "$(thefuck --alias)"

#==============================
#  peco
#==============================
# list repos under ghq
function peco-src() {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
# shortcut key
bindkey '^[' peco-src

#==============================
#  grep + vi
#==============================
function grvi() {
  local filepath="$(echo $(rg -n $@ | peco --query "$LBUFFER" | awk -F : '{print "+" $2 " \047" $1 "\047"}'))"
  if [ "$filepath" != "" ]; then
    eval $(echo "nvim $filepath")
  fi
}

#==============================
#  iTerm2
#==============================
# Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#==============================
#  AWS CLI
#==============================
# Enable command completion
# See http://docs.aws.amazon.com/cli/latest/userguide/cli-command-completion.html for more details.
[[ -f /usr/local/bin/aws_zsh_completer.sh ]] && source /usr/local/bin/aws_zsh_completer.sh

#================================
#  awless: A Mighty CLI for AWS
#================================
[[ -f /usr/local/share/zsh/site-functions/_awless ]] && source /usr/local/share/zsh/site-functions/_awless

#================================
#  ghq
#================================
# Run `ghq get` and change the working directory to the cloned repo
function ggl() {
  ghq get --look $@
}

#================================
#  NVM
#================================
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Calling nvm use automatically in a directory with a .nvmrc file
# Ref. https://github.com/nvm-sh/nvm#automatically-call-nvm-use
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
