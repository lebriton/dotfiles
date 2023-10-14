vim.opt.termguicolors = true
bufferline = require("bufferline")
bufferline.setup({
    options = {
        style_preset = bufferline.style_preset.no_italic,
        separator_style = "slant",
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        },
    }
})
