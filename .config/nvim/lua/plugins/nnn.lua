return {
    {
        'luukvbaal/nnn.nvim',
        keys = {
            { "<leader>e", "<cmd>NnnPicker<cr>", desc = "Open Explorer" },
        },
        config = function()

            require("nnn").setup()

        end
    },
}
