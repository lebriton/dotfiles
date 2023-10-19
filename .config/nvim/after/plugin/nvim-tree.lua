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
        root_folder_label = function(path)
            return vim.fn.fnamemodify(path, ":t")
        end,
    },
    filters = {
        dotfiles = true,
    },
    update_focused_file = { enable = true },
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
})

local api = require "nvim-tree.api"
vim.keymap.set("n", "<leader>pt", function() api.tree.toggle{focus = false} end)

-- https://github.com/nvim-tree/nvim-tree.lua/issues/1880#issuecomment-1369661351
local nt_api = require("nvim-tree.api")
local tree_open = false
local function tab_enter()
    if tree_open then
        nt_api.tree.open()
        vim.api.nvim_command("wincmd p")
    else
        nt_api.tree.close()
    end
end
nt_api.events.subscribe(nt_api.events.Event.TreeOpen, function() tree_open=true end)
nt_api.events.subscribe(nt_api.events.Event.TreeClose, function() tree_open=false end)
vim.api.nvim_create_autocmd({"TabEnter", "TabNewEntered"}, {callback=tab_enter})
