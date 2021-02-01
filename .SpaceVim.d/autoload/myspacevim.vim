function! myspacevim#before() abort
  let g:mapleader = ','

  " https://vim.fandom.com/wiki/Moving_lines_up_or_down#Mappings_to_move_lines
  nnoremap <C-j> :m .+1<CR>==
  nnoremap <C-k> :m .-2<CR>==
  inoremap <C-j> <Esc>:m .+1<CR>==gi
  inoremap <C-k> <Esc>:m .-2<CR>==gi
  vnoremap <C-j> :m '>+1<CR>gv=gv
  vnoremap <C-k> :m '<-2<CR>gv=gv

  let g:spacevim_lint_on_save = 0
endfunction
