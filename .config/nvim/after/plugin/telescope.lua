local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>bb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
vim.keymap.set("n", "gr", builtin.lsp_references, opts)
vim.keymap.set("n", "<leader>ss", builtin.lsp_document_symbols, opts)
vim.keymap.set("n", "<leader>sw", builtin.lsp_workspace_symbols, opts)

vim.keymap.set('n', '<leader>c', builtin.command_history, {})

vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
