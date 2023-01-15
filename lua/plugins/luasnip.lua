return {
	"luasnip",
	lazy = true,
	config = function()
		require("luasnip").filetype_extend("dart", { "flutter" })
	end,
}