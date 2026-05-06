return {
	{
		"folke/zen-mode.nvim",
		opts = {
			alacritty = {
				enabled = true,
			},
		},
		config = function()
			local zen = require("zen-mode")
			local set_key = vim.keymap.set

			set_key("n", "<leader>z", function()
				zen.toggle({
					window = {
						width = 0.70,
					},
				})
			end, { desc = "Toggle zen mode." })
		end,
	},
}
