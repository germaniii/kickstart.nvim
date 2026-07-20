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
    end,
  },
}
