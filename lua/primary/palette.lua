-- Primary colorscheme palette module
-- Google Primary colors based on the original VimScript colorscheme

local M = {}

-- Base color palette - Google"s brand colors
M.colors = {
	RED    = "#EA4335",
	GREEN  = "#34A853",
	YELLOW = "#FBBC04",
	BLUE   = "#4285F4",
	BLACK  = "#202124",
	DGREY  = "#5F6368",
	LGREY  = "#E8EAED",
	WHITE  = "#FFFFFF",
}

-- Get colors based on background setting
function M.pick(background)
	local c = M.colors
	
	if background == "dark" then
		return {
			-- Base colors
			bg = c.BLACK,
			fg = c.BLUE,  -- Normal fg in original is BLUE
			
			-- Greyscale (reversed for dark mode as per original)
			grey0 = c.WHITE,
			grey1 = c.LGREY,
			grey2 = c.DGREY,
			
			-- Accent colors
			red = c.RED,
			green = c.GREEN,
			yellow = c.YELLOW,
			blue = c.BLUE,
			
			-- For transparent background
			none = "NONE",
		}
	else -- light
		return {
			-- Base colors  
			bg = c.WHITE,
			fg = c.BLUE,  -- Normal fg in original is BLUE
			
			-- Greyscale (normal for light mode as per original)
			grey0 = c.BLACK,
			grey1 = c.DGREY,
			grey2 = c.LGREY,
			
			-- Accent colors
			red = c.RED,
			green = c.GREEN,
			yellow = c.YELLOW,
			blue = c.BLUE,
			
			-- For transparent background
			none = "NONE',
		}
	end
end

return M
