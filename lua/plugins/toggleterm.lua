return {
  "akinsho/toggleterm.nvim",
  version = "*",

  config = function()
    require("toggleterm").setup({})
    vim.keymap.set("n", "<C-q>", ":ToggleTerm size=10  direction=horizontal name=desktop<CR>", {})
    vim.keymap.set("t", "<C-q>", "\nexit<CR>", {})
  end,
}
