-- vscode
vim.o.background = "dark"

local ok, rose = pcall(require, "rose-pine")

if not ok then
	return
end

rose.setup({
	dim_nc_background = true,
	disable_background = true,
	disable_float_background = true,
	disable_italics = true,
})

vim.cmd("colorscheme rose-pine")

-- gruvbox

-- vim.g.gruvbox_baby_transparent_mode = true
-- vim.g.gruvbox_baby_keyword_style = false
--
-- vim.cmd([[colorscheme gruvbox-baby]])
--
-- vim.cmd("hi CursorLineNr guifg=#c7ecee")
-- vim.cmd("hi LineNr guifg=#c7ecee")

-- end gruvbox

-- require("onedark").load()

-- local ok, tokyo = pcall(require, "tokyonight")
--
-- if not ok then
-- 	return
-- end
--
-- tokyo.setup({
-- 	-- your configuration comes here
-- 	-- or leave it empty to use the default settings
-- 	style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
-- 	light_style = "day", -- The theme is used when the background is set to light
-- 	transparent = true, -- Enable this to disable setting the background color
-- 	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
-- 	styles = {
-- 		-- Style to be applied to different syntax groups
-- 		-- Value is any valid attr-list value for `:help nvim_set_hl`
-- 		comments = { italic = true },
-- 		keywords = { italic = true },
-- 		functions = {},
-- 		variables = {},
-- 		-- Background styles. Can be "dark", "transparent" or "normal"
-- 		sidebars = "dark", -- style for sidebars, see below
-- 		floats = "dark", -- style for floating windows
-- 	},
-- 	sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
-- 	day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
-- 	hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
-- 	dim_inactive = false, -- dims inactive windows
-- 	lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
--
-- 	--- You can override specific color groups to use other groups or a hex color
-- 	--- function will be called with a ColorScheme table
-- 	---@param colors ColorScheme
-- 	on_colors = function(colors) end,
--
-- 	--- You can override specific highlights to use other groups or a hex color
-- 	--- function will be called with a Highlights and ColorScheme table
-- 	---@param highlights Highlights
-- 	---@param colors ColorScheme
-- 	on_highlights = function(highlights, colors) end,
-- })
--
-- vim.cmd([[colorscheme tokyonight-night]])

-- vim.cmd([[colorscheme gruvbox]])

--
-- local ok1, vscode = pcall(require, "vscode")
-- local ok2, color = pcall(require, "vscode.colors")
--
-- if not ok1 or not ok2 then
-- 	return
-- end
--
-- vscode.setup({
-- 	-- Enable transparent background
-- 	transparent = true,
--
-- 	-- Enable italic comment
-- 	italic_comments = true,
--
-- 	-- Disable nvim-tree background color
-- 	disable_nvimtree_bg = true,
--
-- 	-- Override colors (see ./lua/vscode/colors.lua)
-- 	color_overrides = {
-- 		vscLineNumber = "#FFFFFF",
-- 	},
--
-- 	-- Override highlight groups (see ./lua/vscode/theme.lua)
-- 	group_overrides = {
-- 		-- this supports the same val table as vim.api.nvim_set_hl
-- 		-- use colors from this colorscheme by requiring vscode.colors!
-- 		Cursor = { fg = color.vscDarkBlue, bg = color.vscLightGreen, bold = true },
-- 	},
-- })

-- local custom_highlight = vim.api.nvim_create_augroup("CustomHighlight", {})
-- vim.api.nvim_create_autocmd("ColorScheme", {
-- 	pattern = "nightfly",
-- 	callback = function()
-- 		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { link = "NightflyRed" })
-- 		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { link = "NightflyYellow" })
-- 		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { link = "NightflyBlue" })
-- 		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { link = "NightflyWhite" })
-- 	end,
-- 	group = custom_highlight,
-- })
-- --
-- local ok, _ = pcall(vim.cmd, "colorscheme nightfly")
--
-- if not ok then
-- 	print("color scheme not found")
-- 	return
-- end
--
-- local ok, neo = pcall(require, "neosolarized")
--
-- if not ok then
-- 	return
-- end
--
-- neo.setup({
-- 	comment_italics = true,
-- 	background_set = false,
-- })
--
-- local cb = require("colorbuddy.init")
-- local Color = cb.Color
-- local colors = cb.colors
-- local Group = cb.Group
-- local groups = cb.groups
-- local styles = cb.styles
--
-- Color.new("black", "#000000")
-- Group.new("CursorLine", colors.none, colors.base03, styles.NONE, colors.base1)
-- Group.new("CursorLineNr", colors.yellow, colors.black, styles.NONE, colors.base1)
-- Group.new("Visual", colors.none, colors.base03, styles.reverse)
--
-- local cError = groups.Error.fg
-- local cInfo = groups.Information.fg
-- local cWarn = groups.Warning.fg
-- local cHint = groups.Hint.fg
--
-- Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
-- Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
-- Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
-- Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)
-- Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
-- Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
-- Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
-- Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)