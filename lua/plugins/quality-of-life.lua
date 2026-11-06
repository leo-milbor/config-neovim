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
	-- highlight word under cursor
	{
		"nvim-mini/mini.cursorword",
		config = function()
			require("mini.cursorword").setup()
		end,
	},
	-- Change casing style of words, e.g. snake_case, camelCase, PascalCase, etc.
	{
		"gregorias/coerce.nvim",
		tag = "v5.1.1",
		config = function()
			require("coerce").setup()
			vim.keymap.set("n", "cr", "<Plug>(coerce-normal)", { desc = "Coerce word" })
			vim.keymap.set("n", "co", "<Plug>(coerce-normal-no-lsp)", { desc = "Coerce word (no LSP)" })
			vim.keymap.set("n", "gcr", "<Plug>(coerce-motion)", { desc = "Coerce motion" })
			vim.keymap.set("x", "gcr", "<Plug>(coerce-visual)", { desc = "Coerce visual" })
		end,
		-- Built-in cases
		-- Case         Key
		-- camelCase    c
		-- dot.case     d
		-- kebab-case   k
		-- n12e         n
		-- PascalCase   p
		-- snake_case   s
		-- UPPER_CASE   u
		-- path/case    /
		-- space case   <space>
	},
}
