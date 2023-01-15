return {
	"rose-pine",
	lazy = false,
	priority = 9999,
	opts = {
		dim_nc_background = true,
		disable_background = true,
		disable_float_background = true,
		disable_italics = true,
	},
	config = function()
		vim.cmd([[colorscheme rose-pine]])
	end,
}