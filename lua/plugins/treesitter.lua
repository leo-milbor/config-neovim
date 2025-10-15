return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
		event = { "BufNewFile", "BufReadPre" },
		config = function()
			require("nvim-treesitter.config").setup({
				ensure_installed = "all",
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
			})

			vim.filetype.add({
				extension = {
					axaml = "xml",
					xaml = "xml",
				},
			})

			-- Ensure treesitter is loaded when entering buffer.
			vim.keymap.set("n", "<leader>th", vim.treesitter.start, { desc = "start treesitter" })
			vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
				callback = function(args)
					vim.treesitter.start(args.buf)
				end,
			})
		end,
	},
}
