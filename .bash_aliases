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
  cp "$1" "$1.bak"
}

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias d='dotfiles'
alias v='vim'
alias g='git'
#alias s='screen'
alias t='tmux'
