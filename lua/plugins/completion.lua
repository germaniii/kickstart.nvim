return {
  {
    'saghen/blink.compat',
    -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
    version = '*',
    -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
    lazy = true,
    -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    opts = {},
  },
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets', 'L3MON4D3/LuaSnip' },

    -- use a release tag to download pre-built binaries
    version = '*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept, C-n/C-p for up/down)
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys for up/down)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-e: Hide menu
      -- C-k: Toggle signature help
      --
      -- See the full "keymap" documentation for information on defining your own keymap.
      snippets = { preset = 'luasnip' },
      keymap = { preset = 'default' },

      completion = {
        accept = { auto_brackets = { enabled = true } },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 250,
          treesitter_highlighting = true,
          window = { border = 'rounded' },
        },
      },

      appearance = {
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',
      },
      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
          lsp = {
            min_keyword_length = 2, -- Number of characters to trigger porvider
            score_offset = 0, -- Boost/penalize the score of the items
          },
          path = {
            min_keyword_length = 0,
          },
          snippets = {
            min_keyword_length = 2,
          },
          buffer = {
            min_keyword_length = 5,
            max_items = 5,
          },
        },
      },

      -- Blink.cmp uses a Rust fuzzy matcher by default for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = 'prefer_rust_with_warning' },
      signature = {
        enabled = true,
      },
    },
    opts_extend = { 'sources.default' },
  },
}
