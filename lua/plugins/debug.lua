return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
				"leoluz/nvim-dap-go",
				config = function()
					require("dap-go").setup({})
				end,
			},
			{
				"igorlfs/nvim-dap-view",
				config = function()
					local dap_view = require("dap-view")
					dap_view.setup({})
					local set_key = vim.keymap.set
					local root_map = "<leader>d"
					set_key("n", root_map .. "v", dap_view.toggle, { desc = "toggle debug viewer", noremap = true })
				end,
			},
			{
				"theHamsta/nvim-dap-virtual-text",
				config = function()
					require("nvim-dap-virtual-text").setup({})
				end,
			},
		},
		config = function()
			local dap = require("dap")
			local set_key = vim.keymap.set
			local root_map = "<leader>d"
			set_key("n", root_map .. "d", dap.continue, { desc = "debug", noremap = true })
			set_key("n", root_map .. "n", dap.step_over, { desc = "step over", noremap = true })
			set_key("n", root_map .. "i", dap.step_into, { desc = "step into", noremap = true })
			set_key("n", root_map .. "o", dap.step_out, { desc = "step out", noremap = true })
			set_key("n", root_map .. "b", dap.toggle_breakpoint, { desc = "toggle breakpoint", noremap = true })
			set_key("n", root_map .. "l", dap.run_last, { desc = "run the last debug session again", noremap = true })
		end,
	},
}
