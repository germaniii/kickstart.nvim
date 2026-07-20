return {
  'neovim/nvim-lspconfig',
  ft = 'python',
  config = function()
    vim.lsp.enable('pyright')
  end,
}
