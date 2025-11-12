return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").install("stable")

			-- Ensure treesitter is loaded when entering buffer.
			vim.keymap.set("n", "<leader>th", vim.treesitter.start, { desc = "start treesitter" })
			vim.api.nvim_create_autocmd({ "FileType" }, {
				pattern = {
					"go",
					"rs",
					"lua",
					"cs",
					"sh",
					"ex",
					"exs",
					"dart",
					"xml",
					"html",
					"json",
					"toml",
					"yaml",
				},
				callback = function()
					vim.treesitter.start()
					vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
}
