set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" --- defaults everyone can agree on ---
Plugin 'tpope/vim-sensible'

" --- making Vim look good ---
Plugin 'tomasiser/vim-code-dark'
Plugin 'vim-airline/vim-airline'
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

" Add mouse support
set mouse=a

" Colors
" fix colors when inside GNU/screen
set t_Co=256
set t_ut=
colorscheme codedark    " awesome colorscheme

" UI Config
set number              " show line numbers
set cursorline          " highlight current line
set fillchars+=vert:│

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
set hlsearch            " highlight matches
set ignorecase          " do case insensitive search

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

" --- Plugin 'vim-airline/vim-airline' ---
let g:airline_theme = 'codedark'
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
au User AirlineAfterInit  :let g:airline_section_z = airline#section#create(['%3p%% %L:%v'])

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
        \ { 'type': function('s:gitModified'),  'header': ['    Git modified files']},
        \ { 'type': function('s:gitUntracked'), 'header': ['    Git untracked files']},
        \ { 'type': 'dir',       'header': ['    Recent files in '. getcwd()] },
        \ { 'type': 'files',     'header': ['    Recent files']            },
        \ { 'type': 'sessions',  'header': ['    Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['    Bookmarks']      },
        \ { 'type': 'commands',  'header': ['    Commands']       },
        \ ]

let g:startify_custom_header = ''
let g:startify_bookmarks = [ {'v': '~/.vimrc'}, {'b': '~/.bashrc'} ]
let g:startify_padding_left = 8

" --- Plugin 'junegunn/limelight.vim' ---
let g:limelight_conceal_ctermfg = 'gray'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
