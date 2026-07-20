return {
  {
    'sudo-tee/opencode.nvim',
    version = '*',
    dependencies = {
      {
        'folke/snacks.nvim',
        optional = true,
        opts = {
          input = {},
          picker = {
            actions = {
              opencode_send = function(...)
                return require('opencode').snacks_picker_send(...)
              end,
            },
            win = {
              input = {
                keys = {
                  ['<a-a>'] = { 'opencode_send', mode = { 'n', 'i' } },
                },
              },
            },
          },
        },
      },
      'MeanderingProgrammer/render-markdown.nvim',
    },
    opts = {
      keymap_prefix = '<leader>o',
      default_global_keymaps = true,
    },
    config = function(_, opts)
      vim.o.autoread = true
      require('opencode').setup(opts)

      vim.keymap.set('v', '<leader>ol', function()
        local start_line = vim.fn.line("'<")
        local end_line = vim.fn.line("'>")
        local filename = vim.fn.expand('%')
        local reference = '@' .. filename .. ':L' .. start_line .. '-' .. end_line .. ' '
        require('opencode.api').open_input()
        vim.schedule(function()
          vim.api.nvim_put({ reference }, 'c', true, true)
        end)
      end, { desc = 'Add visual selection as file line reference to opencode' })
    end,
  },
}
