return {
  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = true,
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 60000, lsp_fallback = false }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff_organize_imports', 'ruff_format' },
        php = { 'php_cs_fixer' },
        typescript = { 'prettierd', 'prettier', stop_after_first = true },
        typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        json = { 'prettierd', 'prettier', stop_after_first = true },
        ['.prettierrc'] = { 'prettier', stop_after_first = true },
        html = { 'prettierd', 'prettier', stop_after_first = true },
        css = { 'prettierd', 'prettier', stop_after_first = true },
        svelte = { 'prettier', stop_after_first = true },
        markdown = { 'prettier', stop_after_first = true },
        graphql = { 'prettier', stop_after_first = true },
        go = { 'goimports', 'gofumpt' },
        ruby = { 'rubocop' },
        swift = { 'swiftformat' },
        terraform = { 'terraform_fmt' },
        ['terraform-vars'] = { 'terraform_fmt' },
        sql = { 'sqlfluff' },
        yaml = { 'yamlfmt' },
        toml = { 'taplo' },
        proto = { 'buf' },
        prisma = { 'prisma_format' },
        ansible = { 'ansible_lint' },
        nginx = { 'nginxfmt' },
        haskell = { 'ormolu' },
        ocaml = { 'ocamlformat' },
        fsharp = { 'fantomas' },
        erlang = { 'erlfmt' },
        julia = { 'runic' },
        elm = { 'elm_format' },
        clojure = { 'cljfmt' },
        dart = { 'dart_format' },
        zig = { 'zigfmt' },
        nim = { 'nimpretty' },
        dockerfile = { 'dockerfmt' },
        sh = { 'shfmt' },
        bash = { 'shfmt' },
        zsh = { 'shfmt' },
      },
      formatters = {
        ['php_cs_fixer'] = {
          command = 'php-cs-fixer',
          args = {
            'fix',
            '--rules=@PSR12',
            '$FILENAME',
          },
          stdin = false,
        },
      },
    },
  },
}
