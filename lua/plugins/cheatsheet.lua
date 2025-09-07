return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
    config = function()
      local wk = require("which-key")
      wk.add({
        { "<leader>",   group = "Extended functionality" },
        { "<leader>w",  group = "Windows",               proxy = "<c-w>" }, -- proxy to window mappings
        { "<leader>b",  group = "Buffer" },
        { "<leader>s",  group = "Search & replace" },
        { "<leader>c",  group = "Code" },
        { "<leader>d",  group = "Debugging" },
        { "<leader>f",  group = "Find" },
        { "<leader>g",  group = "Go to" },
        { "<leader>n",  group = "Note taking" },
        { "<leader>r",  group = "Refactoring" },
        { "<leader>rE", group = "Extract (file)" },
        { "<leader>re", group = "Extract" },
        { "<leader>ri", group = "Inline" },
        { "<leader>t",  group = "Testing" },
        { "<leader>e",  group = "Execute code" },
      })
    end,
  },
}
