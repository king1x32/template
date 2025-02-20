if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    -- opts variable is the default configuration table for the setup function call
    -- local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    -- Only insert new sources, do not replace the existing ones
    -- (If you wish to replace, use `opts.sources = {}` instead of the `list_insert_unique` function)
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.prettierd,
      --null_ls.builtins.formatting.astyle,
      --null_ls.builtins.formatting.uncrustify,
      null_ls.builtins.formatting.yamlfmt,
      null_ls.builtins.formatting.autopep8,
      null_ls.builtins.formatting.golines,
      null_ls.builtins.formatting.markdownlint,
      null_ls.builtins.formatting.beautysh,
      null_ls.builtins.formatting.eslint,
      null_ls.builtins.formatting.sql_formatter,
      null_ls.builtins.diagnostics.prettierd,
      null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.diagnostics.luacheck,
      null_ls.builtins.diagnostics.cpplint,
      null_ls.builtins.diagnostics.markdownlint,
      --null_ls.builtins.diagnostics.actionlint,
      null_ls.builtins.diagnostics.yamllint,
      null_ls.builtins.diagnostics.shellcheck,
      null_ls.builtins.diagnostics.pylint,
      null_ls.builtins.diagnostics.tidy,
      null_ls.builtins.code_actions.prettierd,
      null_ls.builtins.code_actions.eslint,
      null_ls.builtins.code_actions.eslint_d,
      null_ls.builtins.code_actions.shellcheck,
    })
  end,
}
