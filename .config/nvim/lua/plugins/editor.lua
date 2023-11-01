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

            { "<leader>gc", "<cmd>Telescope git_branches<cr>", desc = "Git branches" },
            { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
            { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status" },

            { "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Go to definition(s)" },
            { "gr", "<cmd>Telescope lsp_references<cr>", desc = "Go to references" },
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
}
