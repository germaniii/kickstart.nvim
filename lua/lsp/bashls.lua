return {
  'neovim/nvim-lspconfig',
  ft = 'sh',
  config = function()
    vim.lsp.enable('bashls')
  end,
}
