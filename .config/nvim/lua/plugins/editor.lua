return {
    {
        'christoomey/vim-tmux-navigator',
        lazy = false,
    },

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { "<leader>f:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
            { "<leader>f<CR>", function() require("telescope.builtin").resume() end, desc = "Resume Previous Search" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
            { "<leader>fh", "<cmd>Telescope oldfiles<cr>", desc = "Find History" },
            { "<leader>fm", "<cmd>Telescope man_pages<cr>", desc = "Find Man Pages" },

            { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git Commits" },
            { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git Status" },
        },
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },

    {
        "yamatsum/nvim-cursorline",
        config = function()
            require('nvim-cursorline').setup {
                cursorline = {
                    enable = true,
                    timeout = 1000,
                    number = false,
                },
                cursorword = {
                    enable = true,
                    min_length = 3,
                    hl = { underline = true },
                }
            }
        end,
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
                tab_char = "┆",
            },
            scope = { enabled = false },
        },
        main = "ibl",
    },
}
