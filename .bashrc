# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

[ -f ~/.sensible.bash ] && source ~/.sensible.bash
[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.bash_bindings ] && source ~/.bash_bindings
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

shopt -s dotglob # Enable globbing for hidden files
stty -ixon # Disable ctrl-s and ctrl-q

export EDITOR=vim

# TODO: do not add duplicates
export PATH=~/.local/bin:$PATH
export PATH=~/bin:$PATH

prompt_command() {
  light_green="\[\e[1;32m\]"
  light_red="\[\e[1;31m\]"
  blue="\[\e[1;34m\]"
  gray="\[\e[0;37m\]"
  reset="\[\e[m\]"

  local status="$?"
  local status_color=""
  if [ $status != 0 ]; then
    status_color=$light_red
  else
    status_color=$light_green
  fi
  export PS1="${gray}$(__git_ps1 '(%s) ')${reset}${status_color}➜${reset} ${blue}\w${reset} "
}
export GIT_PS1_SHOWDIRTYSTATE=1
export PROMPT_COMMAND=prompt_command

# -----------------------------------------------------------------------------
# specific to current machine

xinput disable "PS/2 Generic Mouse"
