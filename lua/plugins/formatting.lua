return {
  'prettier/vim-prettier', -- prettier plugin used in SE project
  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = true,
      format_on_save = function(bufnr) -- Format On Save with Toggling
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_fallback = false }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'black' },
      },
    },
  },
}
