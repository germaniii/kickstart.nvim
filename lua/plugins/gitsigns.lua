return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        follow_files = true,
      },
      auto_attach = true,
      attach_to_untracked = false,
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
      current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000, -- Disable if file is longer than this (in lines)
      preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
      },
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'
        -- Actions
        vim.keymap.set('n', '<leader>gs', gitsigns.stage_hunk, { desc = 'Stage Hunk', buffer = bufnr })
        vim.keymap.set('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'Reset Hunk', buffer = bufnr })
        vim.keymap.set('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'Preview Hunk', buffer = bufnr })
        vim.keymap.set('n', '<leader>gS', gitsigns.stage_buffer, { desc = 'Stage Buffer', buffer = bufnr })
        vim.keymap.set('n', '<leader>gR', gitsigns.reset_buffer, { desc = 'Reset Buffer', buffer = bufnr })
        vim.keymap.set('n', '<leader>gb', function()
          gitsigns.blame_line { full = true }
        end, { desc = 'Show Full Blame Line' })
        vim.keymap.set('n', '<leader>gd', gitsigns.diffthis, { desc = 'Diff this', buffer = bufnr })
        vim.keymap.set({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end,
    },
  },
}
