return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {},
        config = function()
            local wk = require("which-key")
            wk.register({
                ["<leader>f"] = { name = "Find/Files" },

                ["<leader>g"] = { name = "Git" },

                ["<leader>s"] = { name = "Splits" },
                ["<leader>sh"] = { ":vnew<CR>", "Split window left" },
                ["<leader>sj"] = { ":belowright new<CR>", "Split window down" },
                ["<leader>sk"] = { ":vnew<CR>", "Split window up" },
                ["<leader>sl"] = { ":belowright vnew<CR>", "Split window right" },
                ["<leader>se"] = { "<C-w>=", "Make split windows equal width"},
            })
        end,
    },
}

