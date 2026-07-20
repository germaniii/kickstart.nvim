return {
  'neovim/nvim-lspconfig',
  ft = 'lua',
  config = function()
    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT' },
          workspace = {
            checkThirdParty = false,
            library = {
              '${3rd}/luv/library',
              unpack(vim.api.nvim_get_runtime_file('', true)),
            },
          },
          completion = { callSnippet = 'Replace' },
          diagnostics = { disable = { 'missing-fields' } },
        },
      },
    })
    vim.lsp.enable('lua_ls')
  end,
}
