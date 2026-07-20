return {
  'neovim/nvim-lspconfig',
  ft = 'svelte',
  config = function()
    vim.lsp.enable('svelte')
  end,
}
