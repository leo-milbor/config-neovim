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
		--	vim.cmd.colorscheme("catppuccin-macchiato")
		end,
	},
	{
		"zenbones-theme/zenbones.nvim",
		-- Optionally install Lush. Allows for more configuration or extending the colorscheme
		-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
		-- In Vim, compat mode is turned on as Lush only works in Neovim.
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		config = function()
		    vim.cmd.colorscheme('forestbones')
		end
	},
	{
    'mcncl/alabaster.nvim',
    lazy = false,
    priority = 1000,
    config = function()
     -- vim.cmd.colorscheme('alabaster')
    end,
	},
}
