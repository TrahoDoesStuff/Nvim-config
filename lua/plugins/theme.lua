local theme = "nord"

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
		"shaunsingh/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("nord")
			vim.g.nord_disable_background = true

			local highlights = require("nord").bufferline.highlights({
				italic = true,
				bold = true,
			})

			require("bufferline").setup({
				options = {
					separator_style = "thin",
				},
				highlights = highlights,
			})
		end,
	}
end
