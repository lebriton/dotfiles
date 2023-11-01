return {
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },

    {
        'williamboman/mason-lspconfig.nvim',
        lazy = false,
        opts = {
            ensure_installed = {
                'ansiblels',
                'bashls',
                'cssls',
                'dockerls',
                'docker_compose_language_service',
                'html',
                'jsonls',
                'tsserver',  -- js
                'marksman',  -- markdown
                'intelephense',  -- php
                'pyright',  -- python
                'sqlls',
                'taplo',  -- toml
                'tailwindcss',
                'lemminx',  -- xml
                'yamlls',
            },
        },
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)
            require("mason-lspconfig").setup_handlers {
                function (server_name)
                    require("lspconfig")[server_name].setup {}
                end,
            }
        end
    },

    {
        'neovim/nvim-lspconfig',
        lazy = false,
        keys = {
            { 'K', '<cmd>lua vim.lsp.buf.hover()<cr>' },
            { 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', desc = "Go to definition" },
            -- { '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>' },
        },
    },
}
