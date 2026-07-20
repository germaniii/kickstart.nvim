return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    opts = {
      default_file_explorer = true,
      -- Set to true to watch the filesystem for changes and reload oil
      watch_for_changes = true,
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
      },
      win_options = {
        signcolumn = 'yes:2',
      },
      float = {
        -- Padding around the floating window
        padding = 5,
        win_options = {
          -- winblend = 10,
        },
      },
      columns = {
        'permissions',
        'size',
      },
      keymaps = {
        ['g?'] = 'actions.show_help',
        ['<CR>'] = { 'actions.select', opts = { close = true } },
        ['<C-v>'] = { 'actions.select', opts = { vertical = true, close = true }, desc = 'Open the entry in a vertical split' },
        ['<C-s>'] = { 'actions.select', opts = { horizontal = true, close = true }, desc = 'Open the entry in a horizontal split' },
        ['<C-p>'] = 'actions.preview',
        ['<C-c>'] = 'actions.close',
        ['<C-r>'] = 'actions.refresh',
        ['-'] = 'actions.parent',
        ['_'] = 'actions.open_cwd',
        ['`'] = 'actions.cd',
        ['~'] = { 'actions.cd', opts = { scope = 'tab' }, desc = ':tcd to the current oil directory', mode = 'n' },
        ['gs'] = 'actions.change_sort',
        ['gx'] = 'actions.open_external',
        ['g.'] = 'actions.toggle_hidden',
        ['g\\'] = 'actions.toggle_trash',
        -- ['<C-t>'] = { 'actions.select', opts = { tab = true }, desc = 'Open the entry in new tab' },
      },
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup {
        manual_mode = false, -- Manual mode doesn't automatically change your root directory, so you have
        detection_methods = { 'pattern', 'lsp' },
        patterns = { '.git', 'node_modules', 'vendor', 'package.json' }, -- All the patterns used to detect root dir, when **"pattern"** is in detection_methods
        ignore_lsp = {},
        exclude_dirs = { '.next', 'node_modules', 'vendor', '.cargo', 'build' },
        show_hidden = true,
        silent_chdir = true,
        scope_chdir = 'global',
        datapath = vim.fn.stdpath 'data',
      }
    end,
  },
}
