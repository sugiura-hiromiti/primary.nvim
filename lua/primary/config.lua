-- Primary colorscheme configuration module
-- Reads user preferences from vim.g variables with backward compatibility

local M = {}

-- Helper function to parse boolean values
local function to_boolean(value, default)
  if value == nil then
    return default
  end
  
  -- Handle various truthy values
  if value == true or value == 1 or value == '1' or value == 'true' then
    return true
  elseif value == false or value == 0 or value == '0' or value == 'false' then
    return false
  else
    return default
  end
end

-- Read configuration from vim.g variables
-- Returns a table with configuration options
function M.read()
  return {
    -- Disable italic comments and strings
    -- Default: false (italics enabled)
    disable_italic = to_boolean(vim.g.colorscheme_primary_disable_italic, false),
    
    -- Enable transparent background
    -- Default: false (opaque background)
    transparent_bg = to_boolean(vim.g.colorscheme_primary_enable_transparent_bg, false),
  }
end

return M