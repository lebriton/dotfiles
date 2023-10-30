return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()

            local builtin = require('telescope.builtin')

            local wk = require("which-key")
            wk.register({
                f = {
                    name = "Find/File",
                    f = { builtin.find_files, "Find File" },
                    g = { builtin.live_grep, "Live Grep" },
                    b = { builtin.buffers, "Find Buffer" },
                },
            }, { prefix = "<leader>" })

        end,
    },
}
