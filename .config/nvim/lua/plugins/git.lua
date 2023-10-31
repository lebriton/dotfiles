return {
    {
        "lewis6991/gitsigns.nvim",
        event = "LazyFile", 
        opts = {
            signs = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "" },
                topdelete = { text = "" },
                changedelete = { text = "▎" },
                untracked = { text = "▎" },
            },
        },
        keys = {
            { "<leader>gb", "<cmd>Gitsigns blame_line<cr>", desc = "Blame line" },
            { "<leader>gh", "<cmd>Gitsigns preview_hunk_inline<cr>", desc = "Preview hunk" },
            { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset hunk" },
            { "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset buffer" },
        },
    },
}
