local globals = {
  --  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
  -- Set <space> as the leader key
  -- See `:help mapleader`
  mapleader = ' ',
  maplocalleader = ' ',
  loaded_netrw = 1,
  loaded_netrwPlugin = 1,
}

for key, val in pairs(globals) do
  vim.g[key] = val
end

local opts = {
  number = true, -- Make line numbers default
  -- relativenumber = true, -- You can also add relative line numbers, for help with jumping.
  mouse = 'a', -- Enable mouse mode, can be useful for resizing splits for example!
  showmode = false, -- Don't show the mode, since it's already in status line
  clipboard = 'unnamedplus', -- Sync clipboard between OS and Neovim. Remove this option if you want your OS clipboard to remain independent.
  breakindent = true, -- Enable break indent
  undofile = true, -- Save undo history
  ignorecase = true,
  smartcase = true, -- Case-insensitive searching UNLESS \C or capital in search
  signcolumn = 'yes', -- Keep signcolumn on by default
  updatetime = 250, -- Decrease update time
  timeoutlen = 300,
  splitright = true, -- Configure how new splits should be opened
  splitbelow = true,
  list = true, -- Sets how neovim will display certain whitespace in the editor.
  listchars = { tab = '» ', trail = '·', nbsp = '␣' },
  inccommand = 'split', -- Preview substitutions live, as you type!
  cursorline = true, -- Show which line your cursor is on
  scrolloff = 10, -- Minimal number of screen lines to keep above and below the cursor.
  hlsearch = true, -- Set highlight on search, but clear on pressing <Esc> in normal mode
  swapfile = false,
  tabstop = 4, -- A tab is 4 spaces (display)
  shiftwidth = 4, -- Indent to 4 spaces
  softtabstop = 4, -- A tab is 4 spaces (insert mode)
  wrap = false, -- Disable line wrap
}

for key, val in pairs(opts) do
  vim.opt[key] = val
end
