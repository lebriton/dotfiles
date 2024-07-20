#####################################################################
# WARNING: This file is managed by Ansible.
# Do not manually edit this file.
# Any manual changes will be overwritten the next time Ansible runs.
#####################################################################
# colors
alias ls='ls --color'
alias grep='grep --color'

# confirm before overwriting something
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias ln="ln -i"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias mkdir='mkdir -pv'

bak() {
  cp -r "$1" "$1.bak"
}

mkcd () {
  mkdir "$1" && cd "$1"
}

alias c='codium'
alias d='docker'
alias dc='docker-compose'
alias n='nvim'
alias g='git'
alias t='tmux'

#####################################################################
# WARNING: This file is managed by Ansible.
# Do not manually edit this file.
# Any manual changes will be overwritten the next time Ansible runs.
#####################################################################
