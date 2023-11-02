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
            { "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find files" },
            { "<leader>fg", "<cmd>Telescope live_grep hidden=true<cr>", desc = "Live grep" },
            { "<leader>fo", "<cmd>Telescope oldfiles hidden=true<cr>", desc = "Find old files" },
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
