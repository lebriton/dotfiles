set nocompatible

" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'ntpeters/vim-better-whitespace'
call plug#end()

let mapleader=" "

" Experimental: automatically source vimrc on save.
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

" THEME
set background=dark
colorscheme gruvbox
highlight Normal ctermbg=none

" UI Config
set number
set nowrap

" Spaces & Tabs
set expandtab           " insert spaces when tab is pressed
set tabstop=2           " insert x spaces when tab is pressed
set shiftwidth=2        " change the number of space characters inserted for indentation

" Moving
" visual shifting (does not exit Visual mode)
nnoremap <s-tab> <<
nnoremap <tab> >>
vnoremap <s-tab> <gv
vnoremap <tab> >gv
" treat long lines as break lines (useful when moving around in them)
nmap j gj
nmap k gk
vmap j gj
vmap k gk

" Searching
set hlsearch            " highlight matches
set ignorecase          " do case insensitive search

set hidden

" Save backups and swap files to /tmp
set backup
set backupdir=/tmp
set dir=/tmp

" Use persistent undo files
set undodir=/tmp
set undofile

" Keep the cursor centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Moving text around
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==gi
inoremap <C-k> <esc>:m .-2<CR>==gi
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Work with azerty keyboards
noremap ' <C-^>

xnoremap <leader>p "_dP

nnoremap <leader>w <C-w>

" --- Plug 'vim-airline/vim-airline' ---
let g:airline_theme = 'gruvbox'
au User AirlineAfterInit  :let g:airline_section_z = airline#section#create(['%3p%% %L:%v'])
