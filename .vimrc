set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" --- making Vim look good ---
Plugin 'tomasiser/vim-code-dark'
Plugin 'itchyny/lightline.vim'
Plugin 'Yggdroot/indentLine'

" --- working with Git ---
Plugin 'airblade/vim-gitgutter'

" --- working with Fzf ---
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" --- others ---
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'

call vundle#end()
filetype plugin indent on

" === END OF PLUGINS ===

" Add mouse support
set mouse=a

" Colors
set t_Co=256
set t_ut=
colorscheme codedark    " awesome colorscheme
syntax enable           " enable syntax processing

highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" Spaces & Tabs
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces

" UI Config
set number              " show line numbers
set showcmd             " show command in bottom bar
"set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set laststatus=2        " always display the status line
set noshowmode          " get rid of '-- INSERT --'

" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " do case insensitive search

" Leader Shortcuts
let mapleader=","       " leader is comma

" Save backups and swap files to /tmp
set backup
set backupdir=/tmp
set dir=/tmp

" Use persistent undo files
set undodir=/tmp
set undofile"

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
