# confirm before overwriting something
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias ln="ln -i"

alias mkdir='mkdir -pv'

bak() {
  cp "$1" "$1.bak"
}

# https://johnnydecimal.com/concepts/working-at-the-terminal/
jdfunction() {
  JD_ROOT=~/Documents/jd
  case "$1" in
    cd)
      pushd $JD_ROOT/*/*/${2}*
      ;;
    *)
      tree $JD_ROOT -L 3
      ;;
  esac
}
export jdfunction
alias jd='jdfunction'
