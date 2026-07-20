return {
  'neovim/nvim-lspconfig',
  ft = 'rust',
  config = function()
    vim.lsp.enable('rust_analyzer')
  end,
}
