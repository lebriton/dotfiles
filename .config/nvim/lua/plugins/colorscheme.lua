return {
    {
        'rose-pine/neovim',
        lazy = false,
        name = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end,
    },

    { 'nvim-tree/nvim-web-devicons' },
}
