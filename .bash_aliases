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

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias d='docker'
alias dc='docker-compose'
alias v='vim'
alias g='git'
alias t='tmux'
