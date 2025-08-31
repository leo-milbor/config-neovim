return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",

      -- language adapters
      "nvim-neotest/neotest-go",
      "nvim-neotest/neotest-python",
      "rouge8/neotest-rust",
    },
    config = function()
      -- get neotest namespace (api call creates or returns namespace)
      local neotest_ns = vim.api.nvim_create_namespace("neotest")
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message =
                diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)

      local neotest = require("neotest")

      vim.keymap.set("n", "<Leader>tt", function()
        neotest.run.run()
      end, { desc = "run nearest test", noremap = true })
      vim.keymap.set("n", "<Leader>td", function()
        neotest.run.run({ strategy = "dap" })
      end, { desc = "debug nearest test", noremap = true })
      vim.keymap.set("n", "<Leader>tf", function()
        neotest.run.run(vim.fn.expand("%"))
      end, { desc = "run tests in file", noremap = true })
      vim.keymap.set("n", "<Leader>ts", function()
        neotest.run.stop()
      end, { desc = "stop the nearest test", noremap = true })

      neotest.setup({
        adapters = {
          require("neotest-rust"),
          require("neotest-python"),
          require("neotest-go")({
            recursive_run = true,
          }),
        },
      })
    end,
  },
}
