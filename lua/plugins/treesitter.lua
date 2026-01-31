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
          "mod",
          "sum",
          "rs",
          "lua",
          "cs",
          "sh",
          "ex",
          "exs",
          "dart",
          "make",
          "md",
          "awk",
          "xml",
          "html",
          "json",
          "toml",
          "yaml",
        },
        callback = function()
          vim.treesitter.start()
          vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.bo[0][0].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
