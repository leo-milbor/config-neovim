return {
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"folke/trouble.nvim", -- optional
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("chatgpt").setup({
				api_key_cmd = "echo $OPENAI_API_KEY", -- load from env var
				openai_params = {
					model = "gpt-4o-mini", -- or gpt-3.5-turbo
					temperature = 0.3,
					max_tokens = 1200,
				},
				popup_layout = { width = "80%", height = "80%" },
				popup_window = { border = { style = "rounded" } },
			})

			-- Keymaps
			vim.keymap.set("n", "<leader>ac", ":ChatGPT<CR>", { desc = "Open ChatGPT agent" })
			vim.keymap.set("v", "<leader>ae", ":ChatGPTEditWithInstructions<CR>", { desc = "Edit code with GPT" })
		end,
	},
}
