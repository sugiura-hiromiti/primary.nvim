-- Primary colorscheme for Neovim
-- A Lua port of Google's Primary colorscheme
-- Original: https://github.com/google/vim-colorscheme-primary

local M = {}

-- Load required modules
local palette = require('primary.palette')
local config = require('primary.config')
local groups = require('primary.groups')

-- Set a highlight group
local function set_hl(name, spec)
  vim.api.nvim_set_hl(0, name, spec)
end

-- Apply highlight groups and links
local function apply(highlight_groups, links, cfg)
  -- Apply regular highlight groups
  for name, spec in pairs(highlight_groups) do
    -- Handle italic toggle
    if cfg.disable_italic and spec.italic then
      spec = vim.tbl_extend('force', spec, { italic = false })
    end
    set_hl(name, spec)
  end
  
  -- Apply links
  for name, target in pairs(links) do
    set_hl(name, { link = target })
  end
end

-- Apply transparent background to selected groups
local function apply_transparency(highlight_groups, transparent)
  if not transparent then
    return highlight_groups
  end
  
  -- Groups that should have transparent background
  local transparent_groups = {
    'Normal',
    'NormalFloat', 
    'NonText',
    'EndOfBuffer',
    'SignColumn',
    'LineNr',
    'CursorLineNr',
    'Folded',
    'FoldColumn',
    'StatusLine',
    'StatusLineNC',
    'VertSplit',
    'WinSeparator',
    'WarningMsg',
    'ErrorMsg',
    'ModeMsg',
    'MoreMsg',
    'Question',
    'SpecialKey',
    'Directory',
  }
  
  -- Clone the groups table to avoid modifying the original
  local modified_groups = vim.tbl_deep_extend('force', {}, highlight_groups)
  
  for _, group in ipairs(transparent_groups) do
    if modified_groups[group] then
      modified_groups[group] = vim.tbl_extend('force', modified_groups[group], { bg = 'NONE' })
    end
  end
  
  return modified_groups
end

-- Set terminal colors for consistency
local function set_terminal_colors(colors)
  -- Map terminal colors to the palette
  -- Standard ANSI colors
  vim.g.terminal_color_0  = colors.BLACK   -- Black
  vim.g.terminal_color_1  = colors.RED     -- Red
  vim.g.terminal_color_2  = colors.GREEN   -- Green
  vim.g.terminal_color_3  = colors.YELLOW  -- Yellow
  vim.g.terminal_color_4  = colors.BLUE    -- Blue
  vim.g.terminal_color_5  = colors.RED     -- Magenta (using red)
  vim.g.terminal_color_6  = colors.BLUE    -- Cyan (using blue)
  vim.g.terminal_color_7  = colors.LGREY   -- White
  
  -- Bright colors
  vim.g.terminal_color_8  = colors.DGREY   -- Bright Black
  vim.g.terminal_color_9  = colors.RED     -- Bright Red
  vim.g.terminal_color_10 = colors.GREEN   -- Bright Green
  vim.g.terminal_color_11 = colors.YELLOW  -- Bright Yellow
  vim.g.terminal_color_12 = colors.BLUE    -- Bright Blue
  vim.g.terminal_color_13 = colors.RED     -- Bright Magenta
  vim.g.terminal_color_14 = colors.BLUE    -- Bright Cyan
  vim.g.terminal_color_15 = colors.WHITE   -- Bright White
end

-- Main load function
function M.load()
  -- Clear existing highlights if needed
  if vim.g.colors_name then
    vim.cmd('hi clear')
  end
  
  -- Reset syntax highlighting
  if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
  end
  
  -- Enable true colors if available (documented behavior)
  if vim.fn.has('termguicolors') == 1 and not vim.o.termguicolors then
    vim.o.termguicolors = true
  end
  
  -- Set the colorscheme name
  vim.g.colors_name = 'primary'
  
  -- Read user configuration
  local cfg = config.read()
  
  -- Get the current background setting
  local background = vim.o.background
  
  -- Pick palette based on background
  local colors = palette.pick(background)
  
  -- Build highlight groups based on background
  local highlight_groups, links
  if background == 'dark' then
    highlight_groups, links = groups.build_dark(colors, cfg)
  else
    highlight_groups, links = groups.build_light(colors, cfg)
  end
  
  -- Add modern highlight groups (LSP, Treesitter, etc.)
  highlight_groups, links = groups.add_modern_groups(highlight_groups, links, colors, cfg)
  
  -- Apply transparency if enabled
  highlight_groups = apply_transparency(highlight_groups, cfg.transparent_bg)
  
  -- Apply all highlight groups and links
  apply(highlight_groups, links, cfg)
  
  -- Set terminal colors for consistency
  set_terminal_colors(palette.colors)
end

-- Setup function for configuration (optional, for future use)
function M.setup(opts)
  -- Could be used to set configuration options before loading
  if opts then
    for key, value in pairs(opts) do
      vim.g['colorscheme_primary_' .. key] = value
    end
  end
end

return M
