return {
  'neovim/nvim-lspconfig',
  ft = 'dockerfile',
  config = function()
    vim.lsp.enable('dockerls')
  end,
}
