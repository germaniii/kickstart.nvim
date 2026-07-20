vim.lsp.config('gopls', {
  root_markers = { 'go.work', 'go.mod', '.git' },
})
vim.lsp.enable('gopls')
return {}
