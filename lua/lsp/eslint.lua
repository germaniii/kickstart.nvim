return {
  'neovim/nvim-lspconfig',
  ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  config = function()
    vim.lsp.config('eslint', {
      flags = os.getenv 'DEBOUNCE_ESLINT' and {
        allow_incremental_sync = false,
        debounce_text_changes = 1000,
      } or nil,
    })
    vim.lsp.enable('eslint')
  end,
}
