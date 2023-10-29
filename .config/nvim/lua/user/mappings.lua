-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  n = {
    -- General
    ["x"] = '"_x',  -- do not copy to a register

    -- Splits
    ["<leader>s"] = { name = "Splits" },
    ["<leader>sh"] = { ":vnew<CR>", desc = "Split window left" },
    ["<leader>sj"] = { ":belowright new<CR>", desc = "Split window down" },
    ["<leader>sk"] = { ":vnew<CR>", desc = "Split window up" },
    ["<leader>sl"] = { ":belowright vnew<CR>", desc = "Split window right" },
    ["<leader>se"] = { "<C-w>=", desc = "Make split windows equal width"},

    -- Buffers
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>bn"] = { ":bnext<CR>", desc = "Next buffer" },
    ["<leader>bp"] = { ":bprev<CR>", desc = "Previous buffer" },
  },
}
