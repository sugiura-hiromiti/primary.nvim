--
-- Mapping notes:
-- These highlight groups mirror the original VimScript implementation in
-- colors/primary.vim. Group names, bold/italic usage, and color intent follow
-- the original scheme's sections (UI, Search, Diff, Syntax, etc.) to maintain
-- parity and ease future diffing against the source.

local M = {}

-- Build highlight groups for dark background
function M.build_dark(palette, cfg)
  local p = palette
  local italic = not cfg.disable_italic and 'italic' or nil
  
  -- Based on "dark background" branch in colors/primary.vim
  local groups = {
    -- Editor UI
    Normal = { fg = p.blue, bg = p.bg },
    NormalFloat = { fg = p.blue, bg = p.bg },
    NonText = { fg = p.grey1, bg = p.bg, bold = true },
    EndOfBuffer = { fg = p.grey1, bg = p.bg, bold = true },
    
    -- Cursor and Search
    Cursor = { fg = p.bg, bg = p.grey1, bold = true },
    CursorLine = { bg = p.grey2 },
    CursorColumn = { bg = p.grey2 },
    CursorLineNr = { fg = p.grey1, bg = p.bg, bold = true },
    Search = { fg = p.bg, bg = p.yellow },
    IncSearch = { fg = p.bg, bg = p.yellow },
    
    -- Visual mode
    Visual = { bg = p.grey2 },
    
    -- Line numbers
    LineNr = { fg = p.grey1, bg = p.grey2 },
    SignColumn = { fg = p.yellow, bg = p.grey2 },
    ColorColumn = { bg = p.grey2 },
    
    -- Status line
    StatusLine = { fg = p.grey2, bg = p.grey1, bold = true },
    StatusLineNC = { fg = p.grey1, bg = p.grey2 },
    VertSplit = { fg = p.grey2, bg = p.grey1 },
    WinSeparator = { fg = p.grey2, bg = p.grey1 }, -- Neovim 0.7+
    
    -- Popup menu
    Pmenu = { fg = p.grey0, bg = p.grey2 },
    PmenuSel = { fg = p.grey0, bg = p.blue },
    PmenuSbar = { fg = p.grey0, bg = p.grey2 },
    PmenuThumb = { fg = p.bg, bg = p.grey0 },
    WildMenu = { fg = p.bg, bg = p.yellow },
    
    -- Folding
    Folded = { fg = p.grey1, bg = p.grey2 },
    FoldColumn = { fg = p.grey1, bg = p.grey2 },
    
    -- Messages
    WarningMsg = { fg = p.red, bg = p.bg, bold = true },
    ErrorMsg = { fg = p.red, bg = p.bg, bold = true },
    ModeMsg = { fg = p.blue, bg = p.bg, bold = true },
    MoreMsg = { fg = p.blue, bg = p.bg, bold = true },
    Question = { fg = p.blue, bg = p.bg, bold = true },
    
    -- Special keys and directories
    SpecialKey = { fg = p.grey0, bg = p.bg },
    Directory = { fg = p.green, bg = p.bg },
    Title = { fg = p.grey0, bold = true },
    
    -- Matching parentheses
    MatchParen = { fg = p.bg, bg = p.red },
    
    -- Diff mode
    DiffAdd = { fg = p.grey0, bg = p.blue },
    DiffChange = { fg = p.grey0, bg = p.green },
    DiffDelete = { fg = p.grey0, bg = p.red },
    DiffText = { bg = p.grey1 },
    
    -- Syntax highlighting - Comments
    Comment = { fg = p.green },
    SpecialComment = { fg = p.green, bold = true },
    Todo = { fg = p.bg, bg = p.yellow },
    
    -- Syntax highlighting - Constants
    Constant = { fg = p.grey1 },
    String = { fg = p.red, italic = italic },
    Character = { fg = p.red, italic = italic },
    Number = { fg = p.grey1 },
    Boolean = { fg = p.grey1 },
    Float = { fg = p.grey1 },
    
    -- Syntax highlighting - Identifiers
    Identifier = { fg = p.blue, bold = true },
    Function = { fg = p.blue, bold = true },
    
    -- Syntax highlighting - Statements
    Statement = { fg = p.red, bold = true },
    Conditional = { fg = p.red, bold = true },
    Repeat = { fg = p.red, bold = true },
    Label = { fg = p.red, bold = true },
    Operator = { fg = p.grey1, bold = true },
    Keyword = { fg = p.red, bold = true },
    Exception = { fg = p.red, bold = true },
    
    -- Syntax highlighting - Preprocessor
    PreProc = { fg = p.green, bold = true },
    Include = { fg = p.green, bold = true },
    Define = { fg = p.green, bold = true },
    Macro = { fg = p.green, bold = true },
    PreCondit = { fg = p.green, bold = true },
    
    -- Syntax highlighting - Types
    Type = { fg = p.yellow, bold = true },
    StorageClass = { fg = p.yellow, bold = true },
    Structure = { fg = p.yellow, bold = true },
    Typedef = { fg = p.green, italic = italic },
    
    -- Syntax highlighting - Special
    Special = { fg = p.grey0 },
    SpecialChar = { fg = p.grey0, bold = true },
    Tag = { fg = p.grey1, bold = true },
    Delimiter = { fg = p.grey0 },
    Debug = { fg = p.grey0 },
    
    -- Syntax highlighting - Underlined
    Underlined = { fg = p.grey1, underline = true },
    
    -- Syntax highlighting - Ignore/Error
    Ignore = { fg = p.grey1 },
    Error = { fg = p.bg, bg = p.red },
  }
  
  local links = {}
  
  return groups, links
end

-- Build highlight groups for light background
function M.build_light(palette, cfg)
  local p = palette
  local italic = not cfg.disable_italic and 'italic' or nil
  
  -- Based on "light background" branch in colors/primary.vim
  local groups = {
    -- Editor UI
    Normal = { fg = p.blue, bg = p.bg },
    NormalFloat = { fg = p.blue, bg = p.bg },
    NonText = { fg = p.grey1, bg = p.bg, bold = true },
    EndOfBuffer = { fg = p.grey1, bg = p.bg, bold = true },
    
    -- Cursor and Search
    Cursor = { fg = p.bg, bg = p.grey1, bold = true },
    CursorLine = { bg = p.grey2 },
    CursorColumn = { bg = p.grey2 },
    CursorLineNr = { fg = p.grey1, bg = p.bg, bold = true },
    Search = { fg = p.bg, bg = p.yellow },
    IncSearch = { fg = p.bg, bg = p.yellow },
    
    -- Visual mode
    Visual = { bg = p.grey2 },
    
    -- Line numbers
    LineNr = { fg = p.grey1, bg = p.grey2 },
    SignColumn = { fg = p.yellow, bg = p.grey2 },
    ColorColumn = { bg = p.grey2 },
    
    -- Status line
    StatusLine = { fg = p.grey2, bg = p.grey1, bold = true },
    StatusLineNC = { fg = p.grey1, bg = p.grey2 },
    VertSplit = { fg = p.grey2, bg = p.grey1 },
    WinSeparator = { fg = p.grey2, bg = p.grey1 }, -- Neovim 0.7+
    
    -- Popup menu
    Pmenu = { fg = p.grey0, bg = p.grey2 },
    PmenuSel = { fg = p.grey0, bg = p.blue },
    PmenuSbar = { fg = p.grey0, bg = p.grey2 },
    PmenuThumb = { fg = p.bg, bg = p.grey0 },
    WildMenu = { fg = p.bg, bg = p.yellow },
    
    -- Folding
    Folded = { fg = p.grey1, bg = p.grey2 },
    FoldColumn = { fg = p.grey1, bg = p.grey2 },
    
    -- Messages
    WarningMsg = { fg = p.red, bg = p.bg, bold = true },
    ErrorMsg = { fg = p.red, bg = p.bg, bold = true },
    ModeMsg = { fg = p.blue, bg = p.bg, bold = true },
    MoreMsg = { fg = p.blue, bg = p.bg, bold = true },
    Question = { fg = p.blue, bg = p.bg, bold = true },
    
    -- Special keys and directories
    SpecialKey = { fg = p.grey0, bg = p.bg },
    Directory = { fg = p.green, bg = p.bg },
    Title = { fg = p.grey0, bold = true },
    
    -- Matching parentheses
    MatchParen = { fg = p.bg, bg = p.red },
    
    -- Diff mode
    DiffAdd = { fg = p.grey0, bg = p.blue },
    DiffChange = { fg = p.grey0, bg = p.green },
    DiffDelete = { fg = p.grey0, bg = p.red },
    DiffText = { bg = p.grey1 },
    
    -- Syntax highlighting - Comments
    Comment = { fg = p.green },
    SpecialComment = { fg = p.green, bold = true },
    Todo = { fg = p.bg, bg = p.yellow },
    
    -- Syntax highlighting - Constants
    Constant = { fg = p.grey1 },
    String = { fg = p.red, italic = italic },
    Character = { fg = p.red, italic = italic },
    Number = { fg = p.grey1 },
    Boolean = { fg = p.grey1 },
    Float = { fg = p.grey1 },
    
    -- Syntax highlighting - Identifiers
    Identifier = { fg = p.blue, bold = true },
    Function = { fg = p.blue, bold = true },
    
    -- Syntax highlighting - Statements
    Statement = { fg = p.red, bold = true },
    Conditional = { fg = p.red, bold = true },
    Repeat = { fg = p.red, bold = true },
    Label = { fg = p.red, bold = true },
    Operator = { fg = p.grey1, bold = true },
    Keyword = { fg = p.red, bold = true },
    Exception = { fg = p.red, bold = true },
    
    -- Syntax highlighting - Preprocessor
    PreProc = { fg = p.green, bold = true },
    Include = { fg = p.green, bold = true },
    Define = { fg = p.green, bold = true },
    Macro = { fg = p.green, bold = true },
    PreCondit = { fg = p.green, bold = true },
    
    -- Syntax highlighting - Types
    Type = { fg = p.yellow, bold = true },
    StorageClass = { fg = p.yellow, bold = true },
    Structure = { fg = p.yellow, bold = true },
    Typedef = { fg = p.green, italic = italic },
    
    -- Syntax highlighting - Special
    Special = { fg = p.grey0 },
    SpecialChar = { fg = p.grey0, bold = true },
    Tag = { fg = p.grey1, bold = true },
    Delimiter = { fg = p.grey0 },
    Debug = { fg = p.grey0 },
    
    -- Syntax highlighting - Underlined
    Underlined = { fg = p.grey1, underline = true },
    
    -- Syntax highlighting - Ignore/Error
    Ignore = { fg = p.grey1 },
    Error = { fg = p.bg, bg = p.red },
  }
  
  local links = {}
  
  return groups, links
end

-- Add modern highlight groups (LSP, Treesitter, Diagnostics)
function M.add_modern_groups(groups, links, palette, cfg)
  local p = palette
  
  -- Diagnostics (Neovim 0.5+). Not in the original Vimscript; linked to
  -- closest legacy groups to preserve visual character.
  links.DiagnosticError = 'ErrorMsg'
  links.DiagnosticWarn = 'WarningMsg'
  links.DiagnosticInfo = 'ModeMsg'
  links.DiagnosticHint = 'MoreMsg'
  links.DiagnosticUnderlineError = 'Error'
  links.DiagnosticUnderlineWarn = 'Todo'
  links.DiagnosticUnderlineInfo = 'Underlined'
  links.DiagnosticUnderlineHint = 'Underlined'
  
  -- LSP
  links.LspReferenceText = 'Visual'
  links.LspReferenceRead = 'Visual'
  links.LspReferenceWrite = 'Visual'
  links.LspInlayHint = 'Comment'
  links.LspSignatureActiveParameter = 'Search'
  
  -- Treesitter
  links['@comment'] = 'Comment'
  links['@constant'] = 'Constant'
  links['@constant.builtin'] = 'Constant'
  links['@constant.macro'] = 'Macro'
  links['@string'] = 'String'
  links['@string.escape'] = 'SpecialChar'
  links['@string.special'] = 'SpecialChar'
  links['@character'] = 'Character'
  links['@character.special'] = 'SpecialChar'
  links['@number'] = 'Number'
  links['@boolean'] = 'Boolean'
  links['@float'] = 'Float'
  links['@function'] = 'Function'
  links['@function.builtin'] = 'Function'
  links['@function.macro'] = 'Macro'
  links['@parameter'] = 'Identifier'
  links['@method'] = 'Function'
  links['@field'] = 'Identifier'
  links['@property'] = 'Identifier'
  links['@constructor'] = 'Type'
  links['@conditional'] = 'Conditional'
  links['@repeat'] = 'Repeat'
  links['@label'] = 'Label'
  links['@operator'] = 'Operator'
  links['@keyword'] = 'Keyword'
  links['@exception'] = 'Exception'
  links['@variable'] = 'Identifier'
  links['@type'] = 'Type'
  links['@type.definition'] = 'Typedef'
  links['@type.builtin'] = 'Type'
  links['@type.qualifier'] = 'StorageClass'
  links['@storageclass'] = 'StorageClass'
  links['@structure'] = 'Structure'
  links['@namespace'] = 'Identifier'
  links['@include'] = 'Include'
  links['@preproc'] = 'PreProc'
  links['@debug'] = 'Debug'
  links['@tag'] = 'Tag'
  links['@tag.delimiter'] = 'Delimiter'
  links['@text'] = 'Normal'
  links['@text.strong'] = 'Bold'
  links['@text.emphasis'] = 'Italic'
  links['@text.underline'] = 'Underlined'
  links['@text.strike'] = 'Strikethrough'
  links['@text.title'] = 'Title'
  links['@text.literal'] = 'String'
  links['@text.uri'] = 'Underlined'
  links['@text.reference'] = 'Constant'
  links['@text.todo'] = 'Todo'
  links['@text.note'] = 'SpecialComment'
  links['@text.warning'] = 'WarningMsg'
  links['@text.danger'] = 'ErrorMsg'
  
  -- Git signs
  links.GitSignsAdd = 'DiffAdd'
  links.GitSignsChange = 'DiffChange'
  links.GitSignsDelete = 'DiffDelete'
  
  -- Telescope (popular fuzzy finder)
  links.TelescopeNormal = 'Normal'
  links.TelescopeBorder = 'VertSplit'
  links.TelescopeSelection = 'Visual'
  links.TelescopeSelectionCaret = 'Error'
  links.TelescopeMatching = 'Search'
  
  -- NvimTree (file explorer)
  links.NvimTreeNormal = 'Normal'
  links.NvimTreeFolderIcon = 'Directory'
  links.NvimTreeFolderName = 'Directory'
  links.NvimTreeOpenedFolderName = 'Directory'
  links.NvimTreeEmptyFolderName = 'Comment'
  links.NvimTreeRootFolder = 'Title'
  links.NvimTreeSpecialFile = 'Special'
  links.NvimTreeExecFile = 'Function'
  links.NvimTreeGitDirty = 'DiffChange'
  links.NvimTreeGitNew = 'DiffAdd'
  links.NvimTreeGitDeleted = 'DiffDelete'
  
  return groups, links
end

return M
