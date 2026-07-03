return {
	{
		"romus204/tree-sitter-manager.nvim",
		dependencies = {},
		event = "VeryLazy",
		config = function()
			require("tree-sitter-manager").setup({
				-- Automatically install parsers when opening new filetypes
				auto_install = true,
			})
			vim.wo.foldmethod = "expr"
			vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		end,
	},

	{
		"nvim-mini/mini.ai",
		version = false,
		event = "VeryLazy",
		config = function()
			local ai = require("mini.ai")

			ai.setup()
		end,
	},
}
