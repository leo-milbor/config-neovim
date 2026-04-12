return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			--lua
			lua = { "stylua" },

			-- go
			go = { "goimports", "gofumpt" },

			-- web
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			html = { "prettierd" },
			css = { "prettierd" },
			scss = { "prettierd" },

			-- code
			python = { "black" },
			csharp = { "csharpier" },

			--shell
			sh = { "beautysh" },

			--note
			markdown = { "prettierd" },

			-- data/config
			yaml = { "prettierd" },
			toml = { "taplo" },
			json = { "prettierd" },
		},
	},
	config = function(_, opts)
		-- Merge user opts with format_on_save configuration and setup conform once
		local merged_opts = vim.tbl_deep_extend("force", opts or {}, {
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 500, lsp_format = "fallback" }
			end,
		})

		require("conform").setup(merged_opts)

		vim.keymap.set("n", "grf", require("conform").format, { desc = "Format" })

		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting for all buffers
				vim.g.disable_autoformat = true
			else
				vim.b.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = false,
		})
		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		})
	end,
}
