return {
	{
		"olimorris/codecompanion.nvim",
		version = "^19.0.0",
		opts = {
			inline = {
				adapter = "ollama",
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},
}
