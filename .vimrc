call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'

" --- defaults everyone can agree on ---
Plug 'tpope/vim-sensible'

" --- making Vim look good ---
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'ntpeters/vim-better-whitespace'

" --- fuzzy finding ---
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" --- completion ---
Plug 'ervandew/supertab'

" --- working with Git ---
Plug 'mhinz/vim-signify'

" --- others ---
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'mhinz/vim-startify'

" --- distraction-free editing ---
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

call plug#end()

let mapleader=","

" Add mouse support
set mouse=a

" Colors
set background=dark  	" Setting dark mode
colorscheme gruvbox     " awesome colorscheme
highlight Normal ctermbg=none
highlight LineNr ctermfg=blue
highlight VertSplit ctermbg=none

" UI Config
set fillchars+=vert:│
set number
set relativenumber
set nowrap
set colorcolumn=80

" Spaces & Tabs
set expandtab           " insert spaces when tab is pressed
set tabstop=2           " insert x spaces when tab is pressed
set shiftwidth=2        " change the number of space characters inserted for indentation

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

set hidden

" Save backups and swap files to /tmp
set backup
set backupdir=/tmp
set dir=/tmp

" Use persistent undo files
set undodir=/tmp
set undofile

" Auto reload opened files
" (feels like a hack)
set autoread | au CursorHold * checktime | call feedkeys("lh")

" Behave like other capitals
nnoremap Y y$

" Keep the cursor centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap : :<c-g>u
inoremap ; ;<c-g>u

" Moving text around
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" Better window splits navigation
"nnoremap <silent> <C-H> :wincmd h<CR>
"nnoremap <silent> <C-J> :wincmd j<CR>
"nnoremap <silent> <C-K> :wincmd k<CR>
"nnoremap <silent> <C-L> :wincmd l<CR>
"set splitbelow
"set splitright

" Easy copy-paste to system clipboard
"nnoremap <silent> <C-C> "+yy
"vnoremap <silent> <C-C> "+y
"nnoremap <silent> <C-V> "+p
"inoremap <silent> <C-V> <ESC>"+pa

" --- Plug 'vim-airline/vim-airline' ---
let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
au User AirlineAfterInit  :let g:airline_section_z = airline#section#create(['%3p%% %L:%v'])

" --- Plug 'junegunn/fzf.vim' ---
nnoremap <C-p> :GFiles<Cr>

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
" using 'g' (for gitconfig) seems to be broken
let g:startify_bookmarks = [ {'v': '~/.vimrc'}, {'a': '~/.alacritty.yml'}, {'b': '~/.bashrc'}, {'ba': '~/.bash_aliases'}, {'gc': '~/.gitconfig'}, {'t': '~/.tmux.conf'} ]
let g:startify_padding_left = 8

" --- Plug 'junegunn/goyo.vim' ---
nnoremap <silent> <f8> :Goyo<cr>

" --- Plug 'junegunn/limelight.vim' ---
let g:limelight_conceal_ctermfg = 'gray'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
