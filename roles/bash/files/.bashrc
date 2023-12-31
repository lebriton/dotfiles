# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

[ -f ~/.sensible.bash ] && source ~/.sensible.bash
[ -f ~/.bash_git ] && source ~/.bash_git
[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.bash_bindings ] && source ~/.bash_bindings

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set the bash prompt
prompt_command() {
  exit_code="$?"
  PROMPT_DIRTRIM=0
  if [[ "$exit_code" -eq 0 ]]; then
    PS1="\[\033[32m\] "
  else
    PS1="\[\033[31m\] "
  fi
  PS1+='\[\033[01;33m\]$(__git_ps1 "(%s) ")${debian_chroot:+($debian_chroot)}\[\033[m\]\[\033[01m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
}
export GIT_PS1_SHOWDIRTYSTATE=1
export PROMPT_COMMAND=prompt_command

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

# enable globbing for hidden files
shopt -s dotglob

# Disable ctrl-s and ctrl-q
stty -ixon

# set the default text editor
export EDITOR=nvim

# ===

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
