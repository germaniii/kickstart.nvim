return {
  'neovim/nvim-lspconfig',
  ft = 'yaml',
  config = function()
    vim.lsp.enable('docker_compose_language_service')
  end,
}
