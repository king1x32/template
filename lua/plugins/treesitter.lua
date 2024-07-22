-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    ensure_installed = {
      "lua",
      "vim",
      "javascript",
      "python",
      "yaml",
      "json",
      "json5",
      "java",
      "c",
      "cpp",
      "css",
      "html",
      "arduino",
      "bash",
      "cmake",
      "dockerfile",
      "git_rebase",
      "gitcommit",
      "go",
      "kotlin",
      "latex",
      "make",
      "markdown",
      "proto",
      "regex",
      "ruby",
      "rust",
      "sql",
      "php",
      "typescript",
      "query",
      -- add more arguments for adding more treesitter parsers
    },
    sync_install = false,
  },
}
