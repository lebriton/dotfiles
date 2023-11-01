return {
    {
        'christoomey/vim-tmux-navigator',
        lazy = false,
    },

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { "<leader>f:", "<cmd>Telescope command_history<cr>", desc = "Command history" },
            { "<leader>f<CR>", function() require("telescope.builtin").resume() end, desc = "Resume previous search" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
            { "<leader>fh", "<cmd>Telescope oldfiles<cr>", desc = "Find history" },
            { "<leader>fm", "<cmd>Telescope man_pages<cr>", desc = "Find man pages" },
            { "<leader>fs", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Find symbols" },

            { "<leader>gc", "<cmd>Telescope git_branches<cr>", desc = "Git branches" },
            { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
            { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status" },

            { "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Go to definition(s)" },
            { "gr", "<cmd>Telescope lsp_references<cr>", desc = "Go to references" },
        },
    },

    {
        "yamatsum/nvim-cursorline",
        config = function()
            require('nvim-cursorline').setup {
                cursorline = { enable = false },
                cursorword = {
                    enable = true,
                    min_length = 3,
                    hl = { underline = true },
                }
            }
        end,
    },

    { 
        'echasnovski/mini.map', 
        config = function()
            require('mini.map').setup({
                symbols = {
                    scroll_line = '┃',
                    scroll_view = '│',
                },
            })
            MiniMap.open()
        end,
    },


    {
        "lukas-reineke/indent-blankline.nvim",
        event = "LazyFile",
        opts = {
            indent = {
                char = "┆",
                -- tab_char = "┆",
            },
            scope = { enabled = false },
        },
        main = "ibl",
    },

    {
        'Bekaboo/dropbar.nvim',
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            presets = {
                command_palette = true, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false, -- add a border to hover docs and signature help
            },
            cmdline = {
                format = {
                    command = { pattern = "^:", icon = ":", lang = "vim" },
                    search_down = { kind = "search", pattern = "^/", icon = "/", lang = "regex" },
                    search_up = { kind = "search", pattern = "^%?", icon = "?", lang = "regex" },
                    bash = { pattern = "^:%s*!", icon = ":!", lang = "bash" },
                    help = { pattern = "^:%s*he?l?p?%s+", icon = ":help" },
                    input = {}, -- Used by input()
                    -- lua = false, -- to disable a format, set to `false`
                },
            },
            messages = {
                view_search = false,
            },
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
    },

    {
        'Wansmer/treesj',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        opts = {
              use_default_keymaps = false,
        },
        keys = {
            { '<leader>j', '<cmd>lua require("treesj").toggle()<cr>', desc = "Join code block (toggle)" },
        },
    }
}
