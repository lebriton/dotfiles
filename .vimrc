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
Plugin 'mhinz/vim-startify'

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
set expandtab           " insert spaces when tab is pressed
set tabstop=2           " insert x spaces when tab is pressed
set shiftwidth=2        " change the number of space characters inserted for indentation

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

" Save with Ctrl-S
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

" Better tabs navigation
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :tabm -1<CR>
nnoremap <silent> <A-Right> :tabm +1<CR>
nnoremap <C-T> :tabnew<CR>

" Better window splits navigation
:nmap <silent> <C-h> :wincmd h<CR>
:nmap <silent> <C-j> :wincmd j<CR>
:nmap <silent> <C-k> :wincmd k<CR>
:nmap <silent> <C-l> :wincmd l<CR>
"nnoremap <C-i> :vnew<CR> " Ctrl-Tab is the default
set splitbelow
set splitright

" Easier shortcuts
nnoremap <C-W> :q<CR>
nnoremap <C-Q> :qa!<CR>
