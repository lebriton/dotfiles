return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  { "christoomey/vim-tmux-navigator", lazy = false },
  {
    "ntpeters/vim-better-whitespace",
    lazy = false,
    config = function()
      -- vim.g.better_whitespace_operator =
      vim.g.better_whitespace_guicolor = '#b4637a'  -- https://rosepinetheme.com/palette/
   end,
  },
}
