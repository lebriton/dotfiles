return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { "<leader>f:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
            { "<leader>fh", "<cmd>Telescope oldfiles<cr>", desc = "Find History" },
            { "<leader>fm", "<cmd>Telescope man_pages<cr>", desc = "Find History" },

            { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git Commits" },
            { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git Status" },
        },
    },
}
