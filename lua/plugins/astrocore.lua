-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        --backup = false, -- creates a backup file
        encoding = "utf-8",
        fileencoding = "utf-8",
        linebreak = true,
        list = true,
        listchars = { tab = "> ", trail = "·", extends = ">", precedes = "<", nbsp = "-", eol = "↵" },
        scrolloff = 2, -- Number of lines to keep above and below the cursor
        shiftwidth = 2, -- Number of space inserted for indentation
        showtabline = 2, -- always display tabline
        sidescrolloff = 4, -- Number of columns to keep at the sides of the cursor
        smartindent = true, -- make indenting smarter again
        --swapfile = false, -- creates a swapfile
        tabstop = 2, -- Number of space in a tab
        smarttab = true,
        --showcmd = false -- hide (partial) command in the last line of the screen (for performance)
        -- clipboard = "unnamedplus",
        title = true,
        autoindent = true,
        hlsearch = true,
        backup = false,
        showcmd = true,
        cmdheight = 0,
        -- laststatus = 0,
        expandtab = true,
        inccommand = "split",
        ignorecase = true,
        breakindent = true,
        backspace = {"start", "eol", "indent"},
        splitbelow = true,
        splitright = true,
        splitkeep = "cursor",
        -- mouse = "",
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },
        ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
        -- quick save && quit
        ["<leader>w"] = { ":w<cr> :so %<cr>", desc = "Save&&Reload" },
        ["<leader>x"] = { "<cmd>wq<cr>", desc = "Save&&Quit" },
        ["<C-s>"] = { ":w!<cr> :so %<cr>", desc = "Force Save&&Reload" },
        ["<C-x>"] = { ":wq!<cr>", desc = "Force Save&&Quit" },
        -- change description but the same command
        ["<leader>r"] = { name = "󰑓 Edit && Reload File" },
        ["<leader>rr"] = { ":so %<cr>", desc = "Reload File" },
        ["<leader>re"] = { ":e ~/.config/nvim/lua/user/init.lua<cr>", desc = "Edit user/init.lua" },

        ["<leader>m"] = { name = " Compiler" },

        -- ["zl"] = { "20zl", desc = "20zl" },
        -- ["zh"] = { "20zh", desc = "20zh" },

        ["zl"] = { "zL", desc = "zL" },
        ["zh"] = { "zH", desc = "zH" },

        ["d"] = { '"_d', desc = "Delete without yank" },
        ["p"] = { '"_dP', desc = "Paste without yank" },
        ["x"] = { '"_x', desc = '"_x' },

        -- Increment/decrement
        ["+"] = { "<C-a>", desc = "<C-a>" },
        ["-"] = { "<C-x>", desc = "<C-x>" },

        -- Select all
        ["<C-a>"] = { "gg<S-v>G", desc = "gg<S-v>G" },

        -- Tabs
        ["te"] = { ":tabedit", desc = ":tabedit" },
        ["<tab>"] = { ":tabnext<Return>", desc = ":tabnext<Return>" },
        ["<s-tab>"] = { ":tabprev<Return>", desc = ":tabprev<Return>" },
        ["tw"] = { ":tabclose<Return>", desc = ":tabclose<Return>" },

        -- Split window
        ["ss"] = { ":split<Return>", desc = ":split<Return>" },
        ["sv"] = { ":vsplit<Return>", desc = ":vsplit<Return>" },

        -- Move window
        ["sh"] = { "<C-w>h", desc = "<C-w>h" },
        ["sk"] = { "<C-w>k", desc = "<C-w>k" },
        ["sj"] = { "<C-w>j", desc = "<C-w>j" },
        ["sl"] = { "<C-w>l", desc = "<C-w>l" },

        -- Resize window
        ["<C-S-h>"] = { "<C-w><", desc = "<C-w><" },
        ["<C-S-l>"] = { "<C-w>>", desc = "<C-w>>" },
        ["<C-S-k>"] = { "<C-w>+", desc = "<C-w>+" },
        ["<C-S-j>"] = { "<C-w>-", desc = "<C-w>-" },

        -- Diagnostics
        ["<C-j>"]  = {
          function()
            vim.diagnostic.goto_next()
          end,
          desc = "diagnostic.goto_next"
        }
        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
    },
  },
}
