#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
[[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]] && source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# Customize to your needs...

# Example aliases
alias zshconfig="vim $HOME/.zshrc"
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

# Environmental Variables
export ZSH_HOME=$HOME/.zsh
export MANPATH=/usr/local/man:$MANPATH
export JAVA_HOME=$(/usr/libexec/java_home)
export GOPATH=$HOME
export LESS=-qRn
export VISUAL=vim
export EDITOR=$VISUAL
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export LIBRARY_PATH=/usr/local/lib:$LIBRARY_PATH

# enable Japanese input via SSH by setting the following environmental variables
# (ref: http://qiita.com/suin/items/629372fd08ee9e9cf727)
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# PATH
# set /usr/local/bin before /usr/bin
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.ssh/sh:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

# location to save command histories
export HISTFILE=${HOME}/.zsh_history
# number of histories saved in memory
export HISTSIZE=10000
# number of histories saved in file
export SAVEHIST=1000000
# ignore duplicate command
setopt hist_ignore_dups
# share history between screens
setopt share_history
# save the start and end
setopt EXTENDED_HISTORY
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
# historyコマンドは履歴に登録しない
setopt hist_no_store
# expand history automatically at completion
setopt hist_expand
# enable completion
autoload -U compinit
compinit -C
# Disable start/stop control
stty -ixon
# remove duplicate entries in PATH
typeset -U path PATH


# tmux
[[ "$TMUX" = "" ]] && command -v tmux > /dev/null && exec tmux

#==============================
#  Aliases
#==============================
source "$HOME/.zsh_alias"

alias vi='vim'
alias vr='vim -R'
alias lt='ls -t'
alias rm='rm -i'
alias cp='cp -i'
alias sz="source $HOME/.zshrc"

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
command -v rbenv > /dev/null && eval "$(rbenv init -)"

#==============================
#  pyenv
#==============================
# Load pyenv if it exists
command -v pyenv > /dev/null && eval "$(pyenv init -)"

#==============================
#  nvm
#==============================
# Load nvm automatically
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"

#==============================
#  direnv
#==============================
# Load direnv if it exists
command -v direnv > /dev/null && eval "$(direnv hook zsh)"

#==============================
#  autojump
#==============================
# Load autojump
[[ -s $(brew --prefix)/etc/autojump.sh ]] && source $(brew --prefix)/etc/autojump.sh
# remove 'jo' function for jo command
unfunction jo

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
command -v thefuck > /dev/null && eval "$(thefuck --alias)"

#==============================
#  peco
#==============================
# list repos under ghq
function peco-src() {
  [ ! $(command -v ghq) ] && return
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
#  ptvi
#==============================
function ptvi(){
  local ptfilepath="$(echo $(pt $@ | peco --query "$LBUFFER" | awk -F : '{print "+" $2 " \047" $1 "\047"}'))"
  if [ "$ptfilepath" != "" ]; then
    eval $(echo "vim $ptfilepath")
  fi
}

#==============================
#  awscli
#==============================
source /usr/local/share/zsh/site-functions/_aws

#==============================
#  iTerm2
#==============================
# Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
