-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        "cssls",
        "html",
        "pyright",
        "pylsp",
        "bashls",
        "jsonls",
        "yamlls",
        "gopls",
        "arduino_language_server",
        "tsserver",
        "stylelint_lsp",
        "vimls",
        "cmake",
        "volar",
        "docker_compose_language_service",
        "dockerls",
        "jqls",
        -- "custom_elements_ls",
        "gradle_ls",
        "grammarly",
        -- add more arguments for adding more language servers
      },
      automatic_installation = false,
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = {
        "htmlhint",
        "cmakelang",
        "cmakelint",
        "codespell",
        "commitlint",
        "cpplint",
        "cspell",
        "eslint_d",
        "gdtoolkit",
        "jsonlint",
        "luacheck",
        "markdownlint",
        "pylint",
        "shellcheck",
        "stylelint",
        "textlint",
        "htmlbeautifier",
        "jq",
        "autopep8",
        "beautysh",
        "cmakelang",
        "gdtoolkit",
        "golines",
        "google-java-format",
        "gotests",
        "markdownlint",
        "prettierd",
        "sql-formatter",
        "xmlformatter",
        "yamlfix",
        "yamlfmt",
        -- add more arguments for adding more null-ls sources
      },
      automatic_installation = false,
      automatic_setup = true,
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      ensure_installed = {
        "python",
        "bash-debug-adapter",
        "cpptools",
        "debugpy",
        "go-debug-adapter",
        "java-debug-adapter",
        "java-test",
        "js-debug-adapter",
        "node-debug2-adapter",
        "perl-debug-adapter",
        "php-debug-adapter",
        "vscode-java-decompiler",
        -- add more arguments for adding more debuggers
      },
      automatic_installation = false,
      automatic_setup = true,
    },
  },
}
