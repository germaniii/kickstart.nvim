return {
  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = true,
      format_on_save = function(bufnr) -- Format On Save with Toggling
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 60000, lsp_fallback = false }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'black' },
        php = { 'php_cs_fixer' },
        typescript = { 'prettierd', 'prettier', stop_after_first = true },
        typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        json = { 'prettierd', 'prettier', stop_after_first = true },
        html = { 'prettierd', 'prettier', stop_after_first = true },
        css = { 'prettierd', 'prettier', stop_after_first = true },
      },
      formatter = {
        ['php_cs_fixer'] = {
          command = 'php-cs-fixer',
          args = {
            'fix',
            '--rules=@PSR12', -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
            '$FILENAME',
          },
          stdin = false,
        },
      },
    },
  },
}
