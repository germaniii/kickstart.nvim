return {
  { -- LSP: global setup (LspAttach, mason, capabilities)
    'neovim/nvim-lspconfig',
    version = '*',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float,
            { buffer = event.buf, desc = 'LSP: Show diagnostic [E]rror messages' })
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename,
            { buffer = event.buf, desc = 'LSP: [R]e[n]ame' })
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action,
            { buffer = event.buf, desc = 'LSP: [C]ode [A]ction' })
          vim.keymap.set('n', 'K', vim.lsp.buf.hover,
            { buffer = event.buf, desc = 'LSP: Hover Documentation' })

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf, callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf, callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      local servers = {
        'bashls', 'clangd', 'dockerls', 'docker_compose_language_service',
        'eslint', 'groovyls', 'lua_ls', 'phpactor', 'pyright',
        'rust_analyzer', 'svelte', 'vtsls',
      }

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

      require('mason').setup()
      require('mason-tool-installer').setup { ensure_installed = servers }
      require('mason-lspconfig').setup {
        ensure_installed  = servers,
        automatic_enable  = { exclude = { 'eslint_d' } },
      }
    end,
  },
}
