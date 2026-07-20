return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    opts = {
      completions = { blink = { enabled = true } },
    },
  },
  -- {
  --   -- this is a fork to support blink.cmp
  --   'obsidian-nvim/obsidian.nvim',
  --   version = '*', -- recommended, use latest release instead of latest commit
  --   lazy = true,
  --   ft = 'markdown',
  --   -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  --   -- event = {
  --   --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   --   -- refer to `:h file-pattern` for more examples
  --   --   "BufReadPre path/to/my-vault/*.md",
  --   --   "BufNewFile path/to/my-vault/*.md",
  --   -- },
  --   dependencies = {
  --     -- Required.
  --     'nvim-lua/plenary.nvim',
  --
  --     -- see below for full list of optional dependencies 👇
  --   },
  --   opts = {
  --     ui = { enable = false },
  --     completion = {
  --       -- Enables completion using nvim_cmp
  --       nvim_cmp = false,
  --       -- Enables completion using blink.cmp
  --       blink = true,
  --       -- Trigger completion at 2 chars.
  --       min_chars = 2,
  --     },
  --     workspaces = {
  --       {
  --         name = 'personal',
  --         path = '~/vaults/personal/',
  --       },
  --     },
  --     mappings = {
  --       -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
  --       ['gd'] = {
  --         action = function()
  --           return require('obsidian').util.gf_passthrough()
  --         end,
  --         opts = { noremap = false, expr = true, buffer = true },
  --       },
  --       -- Toggle check-boxes.
  --       ['<leader>ch'] = {
  --         action = function()
  --           return require('obsidian').util.toggle_checkbox()
  --         end,
  --         opts = { buffer = true },
  --       },
  --       -- Smart action depending on context, either follow link or toggle checkbox.
  --       ['<cr>'] = {
  --         action = function()
  --           return require('obsidian').util.smart_action()
  --         end,
  --         opts = { buffer = true, expr = true },
  --       },
  --     },
  --   },
  -- },
}
