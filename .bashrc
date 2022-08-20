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
export PATH=~/.cargo/bin:$PATH # rust

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

prompt_command() {
  PROMPT_DIRTRIM=0
  blue="\[\e[1;34m\]"
  gray="\[\e[0;37m\]"
  reset="\[\e[m\]"
  bold="\[\e[01m\]"
  export PS1="${reset}${gray}$(__git_ps1 '(%s) ')${reset}${bold}\u@\h${reset}:${blue}\w${reset}\$ "
}
export GIT_PS1_SHOWDIRTYSTATE=1
export PROMPT_COMMAND=prompt_command
# -----------------------------------------------------------------------------
# specific to current machine

xinput disable "PS/2 Generic Mouse" 2>/dev/null
