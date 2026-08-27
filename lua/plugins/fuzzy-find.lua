return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-mini/mini.icons" },
		opts = {},
		keys = {
			-- help
			{ "<leader>?", "<CMD>FzfLua keymaps<CR>", desc = "Key Maps" },
			{ "<leader>h", "<CMD>FzfLua help_tags<CR>", desc = "Help Pages" },
			-- improved vim search
			{ "<leader>/", "<CMD>FzfLua grep_curbuf<CR>", desc = "Grep (Buffer)" },
			{ "<leader>f/", "<CMD>FzfLua live_grep<CR>", desc = "Live grep" },
			{ "<leader>:", "<CMD>FzfLua commands<CR>", desc = "Command" },
			{ '<leader>"', "<CMD>FzfLua registers<CR>", desc = "Registers" },
			-- find
			{ "<leader>fa", "<CMD>FzfLua global<CR>", desc = "All" },
			{ "<leader>fb", "<CMD>FzfLua buffers sort_mru=true sort_lastused=true<CR>", desc = "Buffers" },
			{
				"<leader>ff",
				function()
					require("fzf-lua").files({ fd_opts = "--no-ignore --hidden --exclude .git --exclude openspec" })
				end,
				desc = "Files (Root Dir)",
			},
			{
				"<leader>cd",
				function()
					require("fzf-lua").files({
						fd_opts = "--type d --hidden --exclude .git --exclude openspec",
						actions = {
							["default"] = function(selected, opts)
								if not selected or #selected == 0 then
									return
								end

								-- Extract the clean path string from fzf selection data
								local entry = require("fzf-lua").path.entry_to_file(selected[1], opts)

								-- Convert relative path to absolute path based on your current working directory
								local path = require("fzf-lua.path")
								local abs_path = path.is_absolute(entry.path) and entry.path
									or path.join({ opts.cwd or vim.uv.cwd(), entry.path })

								-- Open the target folder using Oil
								require("oil").open(abs_path)
							end,
						},
					})
				end,
				desc = "Directories",
			},
			{ "<leader>fz", "<cmd>FzfLua zoxide<cr>", { desc = "Zoxide change directory" } },
			{ "<leader>fg", "<CMD>FzfLua git_files<CR>", desc = "Files (git-files)" },
			{ "<leader>fr", "<CMD>FzfLua oldfiles<CR>", desc = "Recent" },
			{ "<leader>fc", "<CMD>FzfLua command_history<CR>", desc = "Command History" },
			{
				"<leader>fs",
				function()
					require("fzf-lua").lsp_live_workspace_symbols({})
				end,
				desc = "Goto Symbol (Workspace)",
			},
			-- git
			{ "<leader>ggc", "<CMD>FzfLua git_commits<CR>", desc = "Commits" },
			{ "<leader>ggs", "<CMD>FzfLua git_status<CR>", desc = "Status" },
			{ "<leader>ggh", "<CMD>FzfLua git_bcommits<CR>", desc = "File history" },
			-- Goto
			{ "<leader>gd", "<CMD>FzfLua diagnostics_document<CR>", desc = "Diagnostics (Document)" },
			{ "<leader>gD", "<CMD>FzfLua diagnostics_workspace<CR>", desc = "Diagnostics (Workspace)" },
			{ "<leader>gj", "<CMD>FzfLua jumps<CR>", desc = "Jumplist" },
			{ "<leader>gl", "<CMD>FzfLua loclist<CR>", desc = "Location List" },
			{ "<leader>gm", "<CMD>FzfLua marks<CR>", desc = "Jump to Mark" },
			{ "<leader>gq", "<CMD>FzfLua quickfix<CR>", desc = "Quickfix List" },
			{
				"<leader>gs",
				function()
					require("fzf-lua").lsp_document_symbols({})
				end,
				desc = "Goto Symbol (Document)",
			},
		},
	},
}
