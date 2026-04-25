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
					"lua",

					-- go
					"go",
					"gomod",
					"gosum",
					"gowork",

					-- web
					"html",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
					"css",

					-- code
					"rust",
					"elixir",
					"dart",

					-- shell
					"sh",
					"make",
					"awk",

					-- note
					"markdown",

					-- data/conf
					"xml",
					"json",
					"toml",
					"yaml",
				},
				callback = function()
					vim.treesitter.start()
					-- vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
					-- vim.bo[0][0].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		init = function()
			-- Disable entire built-in ftplugin mappings to avoid conflicts.
			-- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
			vim.g.no_plugin_maps = true
		end,
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = {
					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,
					-- You can choose the select mode (default is charwise 'v')
					--
					-- Can also be a function which gets passed a table with the keys
					-- * query_string: eg '@function.inner'
					-- * method: eg 'v' or 'o'
					-- and should return the mode ('v', 'V', or '<c-v>') or a table
					-- mapping query_strings to modes.
					selection_modes = {
						["@parameter.outer"] = "v", -- charwise
						["@function.outer"] = "V", -- linewise
						-- ['@class.outer'] = '<c-v>', -- blockwise
					},
					-- If you set this to `true` (default is `false`) then any textobject is
					-- extended to include preceding or succeeding whitespace. Succeeding
					-- whitespace has priority in order to act similarly to eg the built-in
					-- `ap`.
					--
					-- Can also be a function which gets passed a table with the keys
					-- * query_string: eg '@function.inner'
					-- * selection_mode: eg 'v'
					-- and should return true of false
					include_surrounding_whitespace = false,
				},
			})

			-- keymaps
			-- You can use the capture groups defined in `textobjects.scm`
			local select_textobject = require("nvim-treesitter-textobjects.select").select_textobject
			vim.keymap.set({ "x", "o" }, "af", function()
				select_textobject("@function.outer", "textobjects")
			end, { desc = "function" })
			vim.keymap.set({ "x", "o" }, "if", function()
				select_textobject("@function.inner", "textobjects")
			end, { desc = "function" })
			vim.keymap.set({ "x", "o" }, "ac", function()
				select_textobject("@class.outer", "textobjects")
			end, { desc = "class" })
			vim.keymap.set({ "x", "o" }, "ic", function()
				select_textobject("@class.inner", "textobjects")
			end, { desc = "class" })
		end,
	},
}
