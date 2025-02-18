return {
  {
    'NStefan002/visual-surround.nvim',
    config = function()
      require('visual-surround').setup {
        -- if set to false, the user must manually add keymaps
        use_default_keymaps = false,
        -- will be ignored if use_default_keymaps is set to false
        surround_chars = { '{', '}', '[', ']', '(', ')', "'", '"', '`', '<', '>' },
        -- delete surroundings when the selection block starts and ends with surroundings
        enable_wrapped_deletion = false,
        -- whether to exit visual mode after adding surround
        exit_visual_mode = false,
      }

      -- Common surround chars
      local prefix = '<leader>sw'
      local surround_chars = { '{', '[', '(', "'", '"', '<', '`' }
      local surround = require('visual-surround').surround
      for _, key in pairs(surround_chars) do
        vim.keymap.set('v', prefix .. key, function()
          surround(key)
        end, { desc = '[visual-surround] Surround selection with ' .. key })
      end

      -- Custom string
      vim.keymap.set('v', '<leader>sc', function()
        local opening = vim.fn.input 'Opening: '
        -- local closing = vim.fn.input 'Closing: ' -- leave empty if you want to use opening string for both
        require('visual-surround').surround(opening) -- (opening, closing)
      end, { desc = '[visual-surround] Surround selection with custom string' })
    end,
  },
}
