return {
  {
    'eddyekofo94/gruvbox-flat.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- gruvbox config
      vim.g.gruvbox_flat_style = 'hard' -- hard | dark | undefined
      vim.g.gruvbox_italic_keywords = 1
      vim.g.gruvbox_transparent = 0

      vim.cmd.colorscheme 'gruvbox-flat'
    end,
  },
  {
    'andreasvc/vim-256noir',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd.colorscheme '256_noir'
    end,
  },
  {
    'slugbyte/lackluster.nvim',
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'lackluster'
      -- vim.cmd.colorscheme 'lackluster-hack'
      -- vim.cmd.colorscheme 'lackluster-mint'
    end,
  },
}
