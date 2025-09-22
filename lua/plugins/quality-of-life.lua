return {
	-- Surround text objects easily
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	-- Automatically add pair i.e. (), [], {}, etc.
	{
		"nvim-mini/mini.pairs",
		version = "*",
		config = function()
			require("mini.pairs").setup()
		end,
	},
	-- Show indent level.
	{
		"nvim-mini/mini.indentscope",
		version = "*",
		config = function()
			require("mini.indentscope").setup()
		end,
	},
}
