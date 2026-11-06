return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				auto_integrations = true,
				integrations = {
					treesitter = true,
				},
			})
			vim.cmd.colorscheme("catppuccin-macchiato")
		end,
	},
	{
		"zenbones-theme/zenbones.nvim",
		lazy = true,
		init = function()
			vim.g.zenbones_compat = 1
		end,
	},
	{
		"dchinmay2/alabaster.nvim",
		lazy = true,
		init = function()
			vim.g.alabaster_dim_comments = true
		end,
	},
}
