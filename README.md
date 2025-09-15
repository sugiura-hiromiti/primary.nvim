this is a lua port of [Google's primary colorscheme](https://github.com/google/vim-colorscheme-primary)

## Primary

##### A Vim/Neovim colorscheme based on Google's colors

Primary is a simple, readable color scheme inspired by Google colors. It ships
with both a Lua implementation for Neovim and a Vimscript implementation for Vim,
supporting light and dark backgrounds.

#### Screenshots

![Light mode](/screenshots/light.png?raw=true)
![Dark mode](/screenshots/dark.png?raw=true)

#### Requirements

- Neovim or Vim. Neovim uses the Lua entrypoint; Vim uses the Vimscript file.
- True color recommended. If available, Primary enables `termguicolors` during load.

#### Installation

- lazy.nvim
  ```lua
  {
    'sugiura-hiromiti/primary.nvim',
    name = 'primary',
    lazy = false,          -- load during startup
    priority = 1000,       -- load before other UI plugins
    config = function()
      -- Optional: set options before loading
      -- vim.g.colorscheme_primary_disable_italic = true
      -- vim.g.colorscheme_primary_enable_transparent_bg = true

      -- Load the colorscheme (pure-Lua entrypoint in Neovim)
      require('primary').load()
    end,
  }
  ```

- packer.nvim
  ```lua
  use({
    'google/vim-colorscheme-primary',
    as = 'primary',
    config = function()
      -- Optional globals as above
      require('primary').load()
    end,
  })
  ```

- vim-plug (Vim or Neovim)
  ```vim
  Plug 'google/vim-colorscheme-primary'
  colorscheme primary
  ```

The Lua entrypoint is registered at `colors/primary.lua`, so `:colorscheme primary`
works in Neovim too. In plain Lua configs you can also call `require('primary').load()`.

#### Options

- `vim.g.colorscheme_primary_disable_italic = true|false`
  - Default: `false`. Disables italics for comments/strings where defined.
- `vim.g.colorscheme_primary_enable_transparent_bg = true|false`
  - Default: `false`. When `true`, key UI groups are set to `bg = NONE`.

You can set these globals before calling `require('primary').load()` or use the
helper:

```lua
require('primary').setup({
  disable_italic = true,
  transparent_bg = true,
})
require('primary').load()
```

#### Background modes

- Dark mode: `:set background=dark`
- Light mode: `:set background=light`

Or set in Lua: `vim.o.background = 'dark'` or `'light'`.

#### True color and terminal palette

- If `has('termguicolors') == 1` and `vim.o.termguicolors` is disabled, Primary
  enables it automatically during load.
- Primary also sets the 16-color terminal palette (`g:terminal_color_0..15`) to
  match the scheme for a more consistent TUI experience.

#### Treesitter, LSP, and popular plugins

- Modern highlight groups are linked to legacy groups to preserve the original
  look and feel. See `lua/primary/groups.lua` for details.
- Notable links include Treesitter, LSP diagnostics, GitSigns, Telescope, and
  NvimTree.

#### Help, contributing, license

- Help: `:help colorscheme-primary`
- Contributing: see CONTRIBUTING.md
- License: see LICENSE

#### Notes for maintainers

- Group definitions in `lua/primary/groups.lua` mirror the original
  Vimscript (`colors/primary.vim`) to preserve visual parity and simplify diffs.

#### Happy Google-inspired coding!

Disclaimer: This is not an official Google product (experimental or otherwise), it is just code that happens to be owned by Google.
