set nocompatible

" Display
filetype plugin indent on
syntax on
set number
set linebreak
set showmatch
highlight ColorColumn cterm=reverse ctermbg=black
set colorcolumn=81
set laststatus=2

" Indentation
set autoindent
set expandtab
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2


" Edit the next '<++>'
inoremap ;; <Esc>/<++><Enter>"_c4l
nmap ;; i;;


" PYTHON PYTHON PYTHON PYTHON PYTHON PYTHON PYTHON PYTHON PYTHON PYTHON PYTHON P
"  ____        _   _
" |  _ \ _   _| |_| |__   ___  _ __
" | |_) | | | | __| '_ \ / _ \| '_ \
" |  __/| |_| | |_| | | | (_) | | | |
" |_|    \__, |\__|_| |_|\___/|_| |_|
"        |___/
" PYTHON PYTHON PYTHON PYTHON PYTHON PYTHON PYTHON PYTHON PYTHON PYTHON PYTHON P
autocmd FileType python :setlocal sw=4 ts=4 sts=4
autocmd FileType python inoremap ;* *args, **kwargs
autocmd FileType python inoremap ;class class :<Enter>def __init__(self, <++>):<Enter><++><Esc>2k$i
autocmd FileType python inoremap ;env #!/usr/bin/env python
autocmd FileType python inoremap ;fim from  import <++><Esc>11hi
autocmd FileType python inoremap ;ifmain def main():<Enter><Enter><Enter><Backspace>if __name__ == '__main__':<Enter>main()<Esc>4ko
autocmd FileType python inoremap ;im import 
autocmd FileType python inoremap ;super super(<Esc>?class<Enter>wyw''$pa, self).<Esc>?def<Enter>wyw''$pa()<Esc>i
autocmd FileType python inoremap ;try try:<Enter><Backspace>except <++>:<Enter><++><Esc>2ko
autocmd FileType python inoremap ;wtry <Esc>Otry:<Esc>jI<Tab><Esc>o<Backspace>except :<Enter><++><Esc>k$i

" {,i}pdb related
autocmd FileType python imap ;debug ;wtryException as e;;# DEBUG: assumes idempotence<Enter>;pdb<Esc>3kyy3jpkA
autocmd FileType python imap ;idebug ;debug<Esc>ddO;ipdb
autocmd FileType python inoremap ;ipdb import ipdb; ipdb.set_trace()
autocmd FileType python inoremap ;pdb import pdb; pdb.set_trace()


" GIT GIT GIT GIT GIT GIT GIT GIT GIT GIT GIT GIT GIT GIT GIT GIT GIT GIT GIT GI
"   ____ _ _
"  / ___(_) |_
" | |  _| | __|
" | |_| | | |_
"  \____|_|\__|
" GIT GIT GIT GIT GIT GIT GIT GIT GIT GIT GIT GIT GIT GIT GIT GIT GIT GIT GIT GI
autocmd FileType gitcommit set textwidth=72
autocmd FileType gitcommit set colorcolumn=73
