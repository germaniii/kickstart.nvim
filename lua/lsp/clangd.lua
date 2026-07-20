return {
  'neovim/nvim-lspconfig',
  ft = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
  config = function()
    vim.lsp.enable('clangd')
  end,
}
