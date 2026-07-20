return {
  'neovim/nvim-lspconfig',
  ft = 'php',
  config = function()
    vim.lsp.config('phpactor', {
      init_options = {
        ['language_server_phpstan.enabled']      = true,
        ['language_server_php_cs_fixer.enabled'] = true,
        ['php_code_sniffer.enabled']             = true,
      },
    })
    vim.lsp.enable('phpactor')
  end,
}
