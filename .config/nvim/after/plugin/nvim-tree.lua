-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
-- require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
    hijack_cursor = true,
    sort_by = "case_sensitive",
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
        highlight_opened_files = 'all',
        special_files = {},
    },
    filters = {
        dotfiles = true,
    },
    update_focused_file = { enable = true },
})

local api = require "nvim-tree.api"
vim.keymap.set("n", "<leader>pt", function() api.tree.toggle{focus = false} end)
