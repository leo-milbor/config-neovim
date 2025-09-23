local mise_path = vim.fn.expand("~") .. ".local/share/mise/installs/flutter/3.35.4-stable/bin/"
local flutter_sdk_path = mise_path .. "flutter"
local dart_sdk_path = mise_path .. "dart"

return {
	{
		"akinsho/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim",
			"mfussenegger/nvim-dap",
		},
		config = function()
			-- require("flutter-tools").setup({
			-- 	flutter_path = flutter_sdk_path,
			--
			-- })
			local dap = require("dap")
			dap.adapters.flutter_test_debug = {
				type = "executable",
				command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
				args = { "flutter_test" },
			}
			local flutter_test_run_config = {
				type = "flutter_test_debug",
				request = "launch",
				name = "Debug Flutter Test",
				dartSdkPath = dart_sdk_path,
				flutterSdkPath = flutter_sdk_path,
				program = "${file}",
				args = {}, -- args are passed down to the underlying `flutter test`
				cwd = "${workspaceFolder}",
			}
			dap.adapters.dart = {
				type = "executable",
				command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
				args = { "flutter" },
			}
			dap.configurations.dart = {
				{
					type = "dart",
					request = "launch",
					name = "Launch Flutter",
					dartSdkPath = dart_sdk_path,
					flutterSdkPath = flutter_sdk_path,
					program = "${workspaceFolder}/lib/main.dart",
					cwd = "${workspaceFolder}",
				},
			}
		end,
	},
}
