return {
  'neovim/nvim-lspconfig',
  ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  config = function()
    vim.lsp.enable('vtsls')
  end,
}
