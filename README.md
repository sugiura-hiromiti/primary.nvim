## Primary
##### A Neovim colorscheme based on Google's colors

#### Screenshots

![Light mode](/screenshots/light.png?raw=true)
![Dark mode](/screenshots/dark.png?raw=true)

**Note**
- Requires true color support. When available, the scheme enables `termguicolors` automatically.
- Pure Lua entrypoint via `colors/primary.lua` calling `require('primary').load()`.

#### Installation (lazy.nvim)

Example lazy.nvim spec:
```lua
{
  'google/vim-colorscheme-primary',
  name = 'primary',
  lazy = false,          -- load during startup
  priority = 1000,       -- load before other UI plugins
  config = function()
    -- Optional: set options before loading
    -- vim.g.colorscheme_primary_disable_italic = true
    -- vim.g.colorscheme_primary_enable_transparent_bg = true

    -- Load the colorscheme (pure-Lua entrypoint)
    require('primary').load()
  end,
}
```

You can also use `:colorscheme primary` directly; the Lua entrypoint is registered at `colors/primary.lua`.

#### Options
- `vim.g.colorscheme_primary_disable_italic = true|false`
  - Default: `false` (italics enabled for comments/strings where defined)
- `vim.g.colorscheme_primary_enable_transparent_bg = true|false`
  - Default: `false` (opaque background). When `true`, key UI groups are set to `bg = "NONE"`.

#### Background modes
- Dark mode: `:set background=dark`
- Light mode: `:set background=light`

You can set this in your config as `vim.o.background = 'dark'` or `'light'`.

#### True color behavior
- If Neovim reports `has('termguicolors') == 1` and `vim.o.termguicolors` is not yet enabled, the scheme sets `vim.o.termguicolors = true` during `require('primary').load()`.

#### Notes for maintainers
- Group definitions in `lua/primary/groups.lua` intentionally mirror the original VimScript scheme (`colors/primary.vim`) to preserve visual parity and make diffs straightforward.
- Modern groups (LSP, Treesitter, Telescope, GitSigns, etc.) link to legacy groups that best match the original style.

#### Happy Google-inspired coding!

Disclaimer: This is not an official Google product (experimental or otherwise), it is just code that happens to be owned by Google.
