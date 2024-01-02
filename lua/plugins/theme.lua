local theme = "catppuccin"

print("Load theme: " .. theme)

if theme == "catppuccin" then
	return {
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	}
end

if theme == "nord" then
	return {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,

    config = function()
      require("nord").setup({})
      vim.cmd.colorscheme("nord")
    end,
  }
end
