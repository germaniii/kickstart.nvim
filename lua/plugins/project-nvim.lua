return {
  {
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup {
        manual_mode = false, -- Manual mode doesn't automatically change your root directory, so you have
        detection_methods = { 'pattern', 'lsp' },
        patterns = { 'node_modules', 'vendor', 'package.json', '.git' }, -- All the patterns used to detect root dir, when **"pattern"** is in detection_methods
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
