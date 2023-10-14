vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) 

vim.keymap.set("n", "<leader>bn", function() vim.cmd('bn') end)
vim.keymap.set("n", "<leader>bp", function() vim.cmd('bp') end)
vim.keymap.set("n", "<leader>bd", function() vim.cmd('bd') end)

vim.keymap.set("n", "<leader>w", '<C-w>')
