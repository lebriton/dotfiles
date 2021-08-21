set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" --- making Vim look good ---
Plugin 'tomasiser/vim-code-dark'
Plugin 'itchyny/lightline.vim'
Plugin 'ntpeters/vim-better-whitespace'

" --- working with Git ---
Plugin 'mhinz/vim-signify'

" --- working with Fzf ---
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" --- others ---
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'mhinz/vim-startify'
Plugin 'ctrlpvim/ctrlp.vim'

" --- distraction-free editing ---
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'

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
vnoremap <silent> <C-S> <ESC>:update<CR>
inoremap <silent> <C-S> <ESC>:update<CR>

" Better tabs navigation
nnoremap <silent> <C-Left> :tabprevious<CR>
nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :tabm -1<CR>
nnoremap <silent> <A-Right> :tabm +1<CR>
nnoremap <silent> <C-T> :tabnew<CR>

" Better window splits navigation
nnoremap <silent> <C-H> :wincmd h<CR>
nnoremap <silent> <C-J> :wincmd j<CR>
nnoremap <silent> <C-K> :wincmd k<CR>
nnoremap <silent> <C-L> :wincmd l<CR>
set splitbelow
set splitright

" Easier shortcuts
nnoremap <C-W> :q<CR>
nnoremap <C-Q> :qa!<CR>

" Autorefresh files when modified externally
set autoread
" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
  \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

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
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

let g:startify_custom_header = ''
