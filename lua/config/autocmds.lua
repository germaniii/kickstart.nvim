-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ User Commands ]]
--  This can be invoked by pressing `:` followed by the command
vim.api.nvim_create_user_command('Format', function(args) -- Add a 'Format' command to use for manual formatting using conform.nvim
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ['end'] = { args.line2, end_line:len() },
    }
  end

  vim.cmd 'OrganizeImports'
  require('conform').format { async = true, lsp_fallback = true, range = range }
end, { range = true })
vim.api.nvim_create_user_command('FormatDisable', function(args) -- Add a toggle command to toggle formatting using conform.nvim
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = 'Disable autoformat-on-save',
  bang = true,
})
vim.api.nvim_create_user_command('FormatEnable', function() -- Add a toggle command to toggle formatting using conform.nvim
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = 'Re-enable autoformat-on-save',
})
vim.api.nvim_create_user_command('OrganizeImports', function() -- Organize imports in typescript projects
  local params = {
    command = '_typescript.organizeImports',
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = '',
  }
  vim.lsp.buf.execute_command(params)
end, {
  desc = 'Auto sort typescript imports',
})

vim.api.nvim_set_keymap('n', '<leader><leader>', '', {
  noremap = true,
  callback = function()
    local oil = require 'oil'
    oil.open_float()
    -- Wait until oil has opened, for a maximum of 1 second.
    vim.wait(1000, function()
      return oil.get_cursor_entry() ~= nil
    end)
    if oil.get_cursor_entry() then
      oil.open_preview()
    end
  end,
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'OilActionsPost',
  callback = function(event)
    if event.data.actions.type == 'move' then
      Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
    end
  end,
})
