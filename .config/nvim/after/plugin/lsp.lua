local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    -- vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    -- vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "<leader>sr", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
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
    handlers = {
        lsp_zero.default_setrp,
    },
})
lsp_zero.setup_servers({
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
})


local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  })
})
