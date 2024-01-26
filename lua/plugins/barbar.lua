return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = true;
	end,
	opts = {
		animation = true,
		insert_at_start = true,
	},
	config = function()
	  vim.keymap.set("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts);
		vim.keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>", opts);

    vim.keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>', opts);
	end,
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
}
