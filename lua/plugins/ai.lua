return {
	{
		"github/copilot.vim",
		config = function()
			-- Disable tab mapping (avoid conflicts with completion/snippets/fzf-lua)
			vim.g.copilot_no_tab_map = true

			vim.keymap.set("i", "<C-A>", 'copilot#Accept("<CR>")', {
				expr = true,
				replace_keycodes = false,
				desc = "Copilot accept suggestion",
			})

			-- Cycle through suggestions
			vim.keymap.set("i", "<M-]>", "<Plug>(copilot-next)", { desc = "Next Copilot suggestion" })
			vim.keymap.set("i", "<M-[>", "<Plug>(copilot-previous)", { desc = "Previous Copilot suggestion" })

			-- Dismiss current suggestion
			vim.keymap.set("i", "<C-\\>", "<Plug>(copilot-dismiss)", { desc = "Dismiss Copilot suggestion" })

			-- Optional: highlight Copilot ghost text differently
			vim.cmd("highlight CopilotSuggestion guifg=#555555 ctermfg=8")
		end,
	},
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
