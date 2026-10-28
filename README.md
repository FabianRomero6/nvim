# nvim

My Neovim configuration for Neovim 0.12. [lazy.nvim](https://github.com/folke/lazy.nvim) installs and loads the plugins.

## Install

You need Neovim, git, and Node.js. Mason installs `ts_ls` and `pyright` with npm, so both language servers fail without Node.js.

1. Install Neovim and a Nerd Font.

	```sh
	brew install neovim node
	brew install --cask font-ioskeley-mono-term-nerd-font
	```

2. Clone the repository and link it to the path Neovim reads.

	```sh
	git clone <repo-url> ~/dotfiles/nvim
	ln -s ~/dotfiles/nvim ~/.config/nvim
	```

3. Set your terminal font to `IoskeleyMonoTerm Nerd Font Mono`. Without a Nerd Font, the statusline icons show as empty boxes.

4. Start `nvim`. On first launch, lazy.nvim installs itself and every plugin, and Mason installs the language servers.

5. Run `:checkhealth` to confirm that everything loaded.

## Add or update a plugin

To add a plugin, create a file in `lua/plugins/` that returns a lazy.nvim spec. lazy.nvim loads every file in that directory.

To update plugins, run `:Lazy sync`. Then commit the changed `lazy-lock.json`, which pins each plugin to a commit.

## Layout

```
init.lua           installs lazy.nvim, then loads vimopts and the plugins
lua/vimopts.lua    editor options, window keymaps, yank highlight
lua/plugins/       one file per plugin
lazy-lock.json     pinned plugin commits
```

## Plugins

| File | Plugin | What it does |
| --- | --- | --- |
| `theme.lua` | rose-pine | Sets the color scheme. |
| `lualine.lua` | lualine | Draws the statusline with the `rose-pine` theme. |
| `gitsigns.lua` | gitsigns | Shows added, changed, and deleted lines in the sign column. Adds hunk keymaps. |
| `which-key.lua` | which-key | Lists the available keymaps after you press a prefix key. |
| `telescope.lua` | telescope | Searches files, text, buffers, and help. |
| `treesitter.lua` | nvim-treesitter | Highlights and indents `c`, `lua`, `vim`, `javascript`, `html`, and `markdown`. |
| `lsp-config.lua` | nvim-lspconfig, mason | Runs `lua_ls`, `ts_ls`, and `pyright`. |
| `autocompletion.lua` | nvim-cmp, LuaSnip | Completes from the language server, snippets, and file paths. |
| `autopairs.lua` | nvim-autopairs | Inserts the closing bracket or quote. |
| `markdown.lua` | render-markdown.nvim | Renders headings, lists, and code blocks inside Markdown buffers. |

## Keymaps

The leader key is Space. Press it and wait 300 ms, and which-key lists the next keys.

| Keys | Mode | Action |
| --- | --- | --- |
| `<leader>sf` | normal | Find files. |
| `<leader>sg` | normal | Search file contents with grep. |
| `<leader><leader>` | normal | Switch buffer. |
| `gd`, `grr`, `gri` | normal | Go to the definition, references, or implementation. |
| `<leader>hs`, `<leader>hr`, `<leader>hp` | normal | Stage, reset, or preview the git hunk under the cursor. |
| `]c`, `[c` | normal | Jump to the next or previous git change. |
| `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>` | normal | Move to the window on the left, below, above, or right. |
| `<C-n>`, `<C-p>`, `<C-y>` | insert | Select the next item, select the previous item, or accept the completion. |

Run `<leader>sk` to search every keymap.
