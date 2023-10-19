vim.g.mapleader = " "

-- general keymaps
vim.keymap.set("n", "<leader>w", '<C-w>')
vim.keymap.set("n", "x", '"_x')  -- do not copy to a register

-- split keymaps
vim.keymap.set("n", "<leader>sh", ":belowright vsp<CR>")  -- split window left
vim.keymap.set("n", "<leader>sj", ":sp<CR>")  -- split window down
vim.keymap.set("n", "<leader>sk", ":belowright sp<CR>")  -- split window up
vim.keymap.set("n", "<leader>sl", ":vsp<CR>")  -- split window right
vim.keymap.set("n", "<leader>se", "<C-w>=")  -- make split windows equal width
vim.keymap.set("n", "<leader>sx", ":close<CR>")  -- close current split window

-- tab keymaps
vim.keymap.set("n", "<leader>to", ":tabnew<CR>")  -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>")  -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>")  -- go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>")  -- go to previous tab
