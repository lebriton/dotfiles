# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.
shopt -s checkwinsize

shopt -s expand_aliases

# Enable globbing for hidden files
shopt -s dotglob

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Enable history appending instead of overwriting.
shopt -s histappend

HISTSIZE=10000
HISTFILESIZE=200000

stty -ixon # Disable ctrl-s and ctrl-q

# Moving around
shopt -s autocd
function -() { cd -; }

# Alias definitions
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

export EDITOR=vim

parse_git () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/' | xargs echo -n ''
  git stash list 2> /dev/null | wc -l | tr -d '0' | xargs echo -n ''
}
#export PROMPT_DIRTRIM=3
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;33m\]$(parse_git)\[\033[01;34m\] \$\[\033[00m\] '


export ANDROID_SDK=/home/bryton/Dev/android-sdk/
export PATH=${ANDROID_SDK}/emulator:${PATH}
