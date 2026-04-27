return {
	{
		"olimorris/codecompanion.nvim",
		version = "^19.0.0",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("codecompanion").setup({
				strategies = {
					chat = {
						adapter = "ollama",
					},
					inline = {
						adapter = "ollama",
					},
					agent = {
						adapter = "ollama",
					},
				},
				adapters = {
					ollama = function()
						return require("codecompanion.adapters").extend("ollama", {
							schema = {
								model = {
									default = "qwen2.5-coder:7b",
								},
								-- Context window.
								num_ctx = {
									default = 16384,
								},
							},
						})
					end,
				},
			})

			local set_key = vim.keymap.set
			local root_map = "<leader>a"
			set_key({ "n", "v" }, root_map .. "i", "<CMD>CodeCompanion<CR>", { desc = "inline", noremap = true })
			set_key("n", root_map .. "a", "<CMD>CodeCompanionAction<CR>", { desc = "actions", noremap = true })
			set_key("n", root_map .. "c", "<CMD>CodeCompanionChat<CR>", { desc = "chat", noremap = true })
		end,
	},
}
