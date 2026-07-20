# nvim-config

Personal Neovim configuration based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), modularized for clarity.

## Requirements

- Neovim >= 0.12.4
- tree-sitter CLI >= 0.26.1
- [ripgrep](https://github.com/BurntSushi/ripgrep) (for grep/search)
- Nerd Font (optional, for icons)

## File Structure

```
~/.config/nvim/
├── init.lua                  Entry point
├── lua/
│   ├── config/
│   │   ├── options.lua       Editor options
│   │   ├── keymaps.lua       Global keymaps
│   │   ├── autocmds.lua      Autocommands & user commands
│   │   └── lazy.lua          Plugin manager setup
│   ├── lsp/                  Per-server configs
│   │   ├── bashls.lua
│   │   ├── clangd.lua
│   │   ├── docker_compose_language_service.lua
│   │   ├── dockerls.lua
│   │   ├── eslint.lua
│   │   ├── groovyls.lua
│   │   ├── lua_ls.lua
│   │   ├── phpactor.lua
│   │   ├── pyright.lua
│   │   ├── rust_analyzer.lua
│   │   ├── svelte.lua
│   │   └── vtsls.lua
│   └── plugins/              Plugin specs
│       ├── ai.lua
│       ├── colorschemes.lua
│       ├── completion.lua
│       ├── eyecandy.lua
│       ├── filesystems.lua
│       ├── formatting.lua
│       ├── git.lua
│       ├── lint.lua
│       ├── lsp.lua            Global LSP setup
│       ├── markdown.lua
│       ├── no-config.lua
│       ├── snacks.lua
│       ├── statusline.lua
│       ├── treesitter.lua
│       ├── typescript.lua
│       └── util.lua
├── lazy-lock.json
├── init.lua
└── README.md
```

## Plugins & Keymaps

### LSP

| Key | Action |
|---|---|
| `<leader>e` | Show diagnostic error messages |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `K` | Hover documentation |

Servers: bashls, clangd, dockerls, docker_compose_language_service, eslint, groovyls, lua_ls, phpactor, pyright, rust_analyzer, svelte, vtsls.

Installed & managed via **mason.nvim** + **mason-lspconfig.nvim** + **mason-tool-installer.nvim**.

### Completion (blink.cmp)

| Key | Action |
|---|---|
| `C-space` | Open completion menu |
| `C-e` | Hide menu |
| `C-k` | Toggle signature help |
| `C-y` | Accept completion |
| `C-n` / `C-p` | Select next/previous |

Snippets via LuaSnip + friendly-snippets.

### Navigation & Search (snacks.nvim)

| Key | Action |
|---|---|
| `<leader>sf` | Smart Find Files |
| `<leader>sg` | Grep |
| `<leader>sd` | Diagnostics |
| `<leader>sD` | Buffer Diagnostics |
| `<leader>sk` | Keymaps |
| `<leader>sq` | Quickfix List |
| `<leader>uC` | Colorschemes |
| `<leader>ss` | LSP Symbols |
| `<leader>sS` | LSP Workspace Symbols |
| `gd` | Goto Definition |
| `gD` | Goto Declaration |
| `gr` | References |
| `gI` | Goto Implementation |
| `gy` | Goto Type Definition |
| `<leader>N` | Neovim News |

### AI Assistant (opencode.nvim)

| Key | Action |
|---|---|
| `<leader>og` | Toggle opencode (open/close) |
| `<leader>oi` | Open input window (current session) |
| `<leader>oI` | Open input window (new session) |
| `<leader>oo` | Open output window |
| `<leader>ot` | Toggle focus opencode / last window |
| `<leader>oq` | Close UI windows |
| `<leader>os` | Select and load a session |
| `<leader>oT` | Timeline picker (navigate/undo/redo/fork) |
| `<leader>op` | Configure provider and model |
| `<leader>oV` | Configure model variant |
| `<leader>od` | Open diff view |
| `<leader>o]` | Next file diff |
| `<leader>o[` | Previous file diff |
| `<leader>oc` | Close diff view |
| `<leader>ox` | Swap pane left/right |
| `<leader>ott` | Toggle tool output (diffs, cmd output) |
| `<leader>otr` | Toggle reasoning output (thinking steps) |
| `<leader>o/` | Quick chat (selection context in visual mode) |
| `<leader>oy` | Add visual selection to context |
| `<leader>oY` | Insert visual selection inline in input |
| `<leader>oR` | Rename current session |
| `<leader>oz` | Toggle zoom |
| `<leader>ov` | Paste image from clipboard |
| `<leader>ora` | Revert all changes since last prompt |
| `<leader>ort` | Revert this file since last prompt |
| `<leader>orA` | Revert all changes since last session |
| `<leader>orT` | Revert this file since last session |
| `<leader>orr` | Restore file to restore point |
| `<leader>orR` | Restore all files to restore point |
| `<leader>oS` | Select child session |
| `<leader>oP` | Select parent session |
| `<leader>oB` | Select sibling session |
| `<leader>oD` | Debug message |
| `<leader>oO` | Debug output |
| `<leader>ods` | Debug session |
| `<leader>opa` | Accept permission (once) |
| `<leader>opA` | Accept permission (always) |
| `<leader>opd` | Deny permission |
| `<M-m>` | Switch agent mode (build/plan) |
| `<M-r>` | Cycle model variant |
| `~` (input) | Pick file and add to context |
| `@` (input) | Insert mention (file/agent) |
| `/` (input) | Slash commands |
| `#` (input) | Manage context items |

### Git (gitsigns.nvim)

| Key | Action |
|---|---|
| `<leader>gs` | Stage hunk |
| `<leader>gr` | Reset hunk |
| `<leader>gp` | Preview hunk |
| `<leader>gS` | Stage buffer |
| `<leader>gR` | Reset buffer |
| `<leader>gb` | Blame line |
| `<leader>gd` | Diff this |
| `ih` (operator) | Select git hunk |

### Search & Replace (grug-far.nvim)

| Key | Action |
|---|---|
| `<leader>S` | Open grug-far |

### File Explorer (oil.nvim)

| Key | Action |
|---|---|
| `<leader><leader>` | Open oil.nvim |

Within oil:

| Key | Action |
|---|---|
| `<CR>` | Open file (close float) |
| `<C-v>` | Open in vertical split |
| `<C-s>` | Open in horizontal split |
| `<C-p>` | Preview |
| `-` | Parent directory |
| `_` | Open CWD |
| `gx` | Open externally |
| `g.` | Toggle hidden files |
| `gs` | Change sort |

### Visual Surround

| Key | Action |
|---|---|
| `<leader>sw{` | Surround with `{ }` |
| `<leader>sw[` | Surround with `[ ]` |
| `<leader>sw(` | Surround with `( )` |
| `<leader>sw"` | Surround with `"` |
| `<leader>sw'` | Surround with `'` |
| `<leader>sw<` | Surround with `< >` |
| `<leader>sw\`` | Surround with `` ` `` |
| `<leader>sc` | Surround with custom string |

### Window Management

| Key | Action |
|---|---|
| `<C-h>` | Focus left window |
| `<C-l>` | Focus right window |
| `<C-j>` | Focus lower window |
| `<C-k>` | Focus upper window |

### Formatting (conform.nvim)

| Command | Action |
|---|---|
| `:Format` | Format current buffer |
| `:FormatDisable` | Disable autoformat-on-save |
| `:FormatEnable` | Re-enable autoformat-on-save |

Formats on save by default. Toggle with `:FormatDisable` / `:FormatEnable`.

### Linting (nvim-lint)

Runs on `BufWritePost`, `BufReadPost`, `InsertLeave`. Configured per filetype.

### General

| Feature | Action |
|---|---|
| `<Esc>` | Clear search highlight |
| Yank | Highlight yanked text |
| `gc` | Comment/Uncomment (Comment.nvim / ts-comments.nvim) |
| `vim-sleuth` | Auto-detect tab/indent settings |
| `vim-visual-multi` | Multi-cursor selection |

### TypeScript (tsc.nvim)

| Command | Action |
|---|---|
| `:TSC` | Run TypeScript compiler check |

Diagnostics shown in quickfix list.

### Appearance

- **Colorscheme**: gruvbox-flat (hard)
- **Statusline**: lualine.nvim (gruvbox theme)
- **Additional themes available**: lackluster, 256noir
- **Cursor**: smear-cursor.nvim
- **Notifications**: noice.nvim (cmdline replacement with message history)
- **Markdown**: render-markdown.nvim

### Treesitter

Languages installed: bash, c, html, lua, markdown, vim, vimdoc, php, typescript, javascript, ninja, rst.

`nvim-treesitter-context` shows the current function/class context at the top of the window (`gt` to jump to context).

### Project

`project.nvim` auto-detects project root via `.git`, `node_modules`, `vendor`, `package.json`. Auto-changes CWD on project entry.

## Mason Tools

LSP servers, linters, and formatters are installed via Mason. Run `:Mason` to manage them. The following are auto-installed:

- **LSP**: bashls, clangd, dockerls, docker_compose_language_service, eslint, groovyls, lua_ls, phpactor, pyright, rust_analyzer, svelte, vtsls
- **Formatters**: stylua, black, isort, php-cs-fixer, prettierd, prettier
- **Linters**: fish (example; extend in `lua/plugins/lint.lua`)
