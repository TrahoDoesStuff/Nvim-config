return {
  "stevearc/aerial.nvim",
  opts = {},
  -- Optional dependencies
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()

    vim.keymap.set("n", "<C-a>", "<cmd>AerialToggle<CR>", {})

    require("aerial").setup({})
  end,
}
