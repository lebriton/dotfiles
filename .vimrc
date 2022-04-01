set nocompatible

" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'

" --- defaults everyone can agree on ---
Plug 'tpope/vim-sensible'

" --- making Vim look good ---
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'ntpeters/vim-better-whitespace'

" --- ... and ergonomic ---
Plug 'mhinz/vim-startify'
Plug 'liuchengxu/vim-which-key'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-unimpaired'

" --- project managment ---
Plug 'tpope/vim-eunuch'
Plug 'airblade/vim-rooter'

" --- fuzzy finding ---
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" --- completion ---
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'

" --- distraction-free editing ---
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" --- wiki ---
Plug 'vimwiki/vimwiki'

call plug#end()

let mapleader=" "

" Add mouse support
"set mouse=a

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
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==gi
inoremap <C-k> <esc>:m .-2<CR>==gi
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Work with azerty keyboards
noremap ' <C-^>

" Buffer navigation
nnoremap <PageUp>   :bprevious<CR>
nnoremap <PageDown> :bnext<CR>

set conceallevel=0

" --- Plug 'vim-airline/vim-airline' ---
let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#buffers_label = ''
au User AirlineAfterInit  :let g:airline_section_z = airline#section#create(['%3p%% %L:%v'])

" --- Plug 'junegunn/fzf.vim' ---
nnoremap <C-p> :Files<Cr>
nnoremap <leader>/ :BLines<Cr>
nnoremap <C-b> :Buffers<Cr>

" --- Plug 'neoclide/coc.nvim' ---
let g:coc_disable_startup_warning = 1
source ~/.coc.vimrc
let g:coc_global_extensions = [
        \ 'coc-json',
        \ 'coc-yaml',
        \ 'coc-xml',
        \ 'coc-git',
        \ 'coc-pyright',
        \ 'coc-html',
        \ 'coc-css',
        \ 'coc-snippets',
        \ 'coc-sh',
        \ 'coc-htmldjango',
        \ ]

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

" using 'g' (for gitconfig) seems to be broken
let g:startify_bookmarks = [
        \ {'v': '~/.vimrc'},
        \ {'vc': '~/.coc.vimrc'},
        \ {'b': '~/.bashrc'},
        \ {'ba': '~/.bash_aliases'},
        \ {'bb': '~/.bash_bindings'},
        \ {'gc': '~/.gitconfig'},
        \ {'t': '~/.tmux.conf'},
        \ ]
let g:startify_padding_left = 8
let g:startify_custom_header = startify#pad(split(system('vim --version | head -1'), '\n'))

" --- Plug 'liuchengxu/vim-which-key' ---
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=500
let g:which_key_disable_default_offset=1

" --- Plug 'junegunn/goyo.vim' ---
nnoremap <silent> <f8> :Goyo<cr>

" --- Plug 'junegunn/limelight.vim' ---
let g:limelight_conceal_ctermfg = 'gray'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" --- Plug 'vimwiki/vimwiki' ---
let g:vimwiki_list = [{'path': '~/Nextcloud/Notes/',
                     \ 'syntax': 'markdown', 'ext': '.md',
                     \ 'auto_toc': 1,
                     \ 'auto_tags': 1,
                     \ 'auto_diary_index': 1,
                     \ 'auto_generate_links': 1,
                     \ 'auto_generate_tags': 1,
                     \ }]
let g:vimwiki_auto_header = 1
