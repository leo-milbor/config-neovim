return {
	{ "github/copilot.vim" },
	{
		"olimorris/codecompanion.nvim",
		version = "^19.0.0",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"franco-ruggeri/codecompanion-spinner.nvim",
		},
		config = function()
			require("codecompanion").setup({
				strategies = {
					chat = {
						adapter = "copilot",
					},
					inline = {
						adapter = "copilot",
					},
					agent = {
						adapter = "copilot",
					},
				},
				extensions = {
					spinner = {},
				},
				adapters = {
					ollama = function()
						return require("codecompanion.adapters").extend("ollama", {
							schema = {
								model = {
									default = "codestral:22b",
								},
								-- Context window.
								num_ctx = {
									default = 16384,
								},
								extra_body = {
									temperature = 0.1, -- Limit randomness -> less creativity
									top_p = 0.9, -- Filter out less likely token
									repeat_penalty = 1.1, -- Increase penalty for repeated tokens.
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
