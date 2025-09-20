return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
		config = function()
			local wk = require("which-key")
			wk.add({
				{ "<leader>", group = "Extended functionality" },
				{ "<leader>a", group = "AI tools" },
				{ "<leader>b", group = "Buffer" },
				{ "<leader>d", group = "Debugging" },
				{ "<leader>e", group = "Execute code" },
				{ "<leader>f", group = "Find" },
				{ "<leader>g", group = "Go to or LSP action" },
				{ "<leader>i", group = "Show information" },
				{ "<leader>n", group = "Note taking" },
				{ "<leader>r", group = "Refactoring" },
				{ "<leader>re", group = "Extract" },
				{ "<leader>rE", group = "Extract (file)" },
				{ "<leader>ri", group = "Inline" },
				{ "<leader>s", group = "Search & replace" },
				{ "<leader>t", group = "Testing" },
				{ "<leader>w", group = "Windows", proxy = "<c-w>" }, -- proxy to window mappings
			})
		end,
	},
}
