set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" --- making Vim look good ---
Plugin 'tomasiser/vim-code-dark'
"Plugin 'itchyny/lightline.vim'
Plugin 'ntpeters/vim-better-whitespace'

" --- navigation ---
Plugin 'preservim/tagbar'

" --- completion ---
Plugin 'ervandew/supertab'

" --- working with Git ---
Plugin 'mhinz/vim-signify'

" --- others ---
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'mhinz/vim-startify'

" --- distraction-free editing ---
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'

call vundle#end()
filetype plugin indent on

" === END OF PLUGINS ===

" Add mouse support
set mouse=a

" Colors
" fix colors when inside GNU/screen
set t_Co=256
set t_ut=
colorscheme codedark    " awesome colorscheme
syntax enable           " enable syntax processing

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

" Moving
set scrolloff=3         " Minumum lines to keep above and below cursor
" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv
" treat long lines as break lines (useful when moving around in them)
nmap j gj
nmap k gk
vmap j gj
vmap k gk

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
set undofile

" Better window splits navigation
nnoremap <silent> <C-H> :wincmd h<CR>
nnoremap <silent> <C-J> :wincmd j<CR>
nnoremap <silent> <C-K> :wincmd k<CR>
nnoremap <silent> <C-L> :wincmd l<CR>
set splitbelow
set splitright

" Easier shortcuts
nnoremap <silent> <F2> :TagbarToggle<CR>
nnoremap <silent> <F3> :Goyo<CR>

" --- Plugin 'mhinz/vim-startify' ---
" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

let g:startify_custom_header = ''

" --- Plugin 'junegunn/limelight.vim' ---
let g:limelight_conceal_ctermfg = 'gray'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
