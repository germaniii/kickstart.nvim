return {
  { -- LSP: global setup (LspAttach, mason, capabilities)
    'neovim/nvim-lspconfig',
    lazy = false,
    version = '*',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
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

      require('mason').setup()

      local servers = {
        'bashls', 'clangd', 'dockerls', 'docker_compose_language_service',
        'eslint', 'groovyls', 'lua_ls', 'phpactor', 'pyright',
        'rust_analyzer', 'svelte', 'vtsls',
        -- Tier 1
        'terraformls', 'sqlls', 'yamlls', 'taplo', 'marksman',
        'buf_ls', 'prismals', 'graphql', 'ansiblels', 'nginx_language_server',
        -- Tier 2
        'gopls', 'ruby_lsp', 'sourcekit_lsp', 'jdtls', 'kotlin_lsp',
        'metals', 'elixir_ls', 'csharp_ls', 'air',
        -- Tier 3
        'hls', 'ocamllsp', 'fsautocomplete', 'elp',
        'julials', 'elmls', 'clojure_lsp', 'dartls', 'zls', 'nim_langserver',
      }

      require('mason-lspconfig').setup {
        ensure_installed  = servers,
        automatic_enable  = { exclude = { 'eslint_d' } },
      }

      for _, name in ipairs(servers) do
        pcall(require, 'lsp.' .. name)
      end
    end,
  },
}
