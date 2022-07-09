set nocompatible

" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" --- defaults everyone can agree on ---
Plug 'tpope/vim-sensible'

" --- UI/UX ---
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mhinz/vim-startify'
Plug 'liuchengxu/vim-which-key'

" --- MOVEMENTS ---
Plug 'tpope/vim-surround'

" --- PROJECT MANAGEMENT ---
Plug 'airblade/vim-rooter'

" --- FINDING STUFF ---
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" --- AUTO-COMPLETION ---
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'

call plug#end()

let mapleader=" "

" Automatically source vimrc on save.
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

" THEME
set background=dark
colorscheme gruvbox
highlight Normal ctermbg=none
highlight LineNr ctermfg=blue

" UI Config
set number
set nowrap

" Spaces & Tabs
set expandtab           " insert spaces when tab is pressed
set tabstop=2           " insert x spaces when tab is pressed
set shiftwidth=2        " change the number of space characters inserted for indentation

" Moving
" visual shifting (does not exit Visual mode)
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

" Auto reload opened files
" (feels like a hack)
set autoread | au CursorHold * checktime | call feedkeys("lh")

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

" Buffer navigation
nnoremap <PageUp>   :bprevious<CR>
nnoremap <PageDown> :bnext<CR>

" Toggle paste mode
" https://dev.to/andy4thehuynh/create-a-shortcut-to-toggle-paste-mode-with-vim-5205
function! TogglePaste()
    if(&paste == 0)
        set paste
        echo "Paste Mode Enabled"
    else
        set nopaste
        echo "Paste Mode Disabled"
    endif
endfunction
map <leader>p :call TogglePaste()<cr>

set conceallevel=0

" --- Plug 'vim-airline/vim-airline' ---
let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#buffers_label = ''
au User AirlineAfterInit  :let g:airline_section_z = airline#section#create(['%3p%% %L:%v'])

" --- Plug 'junegunn/fzf.vim' ---
nnoremap <C-p> :Files<Cr>
nnoremap <C-t> :Tags<Cr>

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
let g:startify_lists = [
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
let g:startify_change_to_dir = 0

" --- Plug 'liuchengxu/vim-which-key' ---
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=500
let g:which_key_disable_default_offset=1
