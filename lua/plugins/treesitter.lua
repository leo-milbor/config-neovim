return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    config = function()
      require("nvim-treesitter.config").setup({
        ensure_installed = {
          "awk",
          "bash",
          "css",
          "csv",
          "dockerfile",
          "fsharp",
          "go",
          "gomod",
          "gowork",
          "html",
          "ini",
          "java",
          "json",
          "latex",
          "lua",
          "markdown",
          "markdown_inline",
          "mermaid",
          "proto",
          "python",
          "regex",
          "rust",
          "sql",
          "sxhkdrc",
          "toml",
          "typescript",
          "xml",
          "yaml",
        },
        auto_install = true,
      })
    end
  },
}
