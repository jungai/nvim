return {
	"nvim-tree",
	lazy = true,
	init = function()
		vim.g.loaded = 1
		vim.g.loaded_netrwPlugin = 1
		vim.g.nvim_tree_show_icons = {
			git = 0,
			folders = 0,
			files = 0,
			folder_arrows = 0,
		}
		-- change color for arrows in tree to light blue
		vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])
	end,
	opts = {
		actions = {
			open_file = {
				window_picker = {
					enable = false,
				},
			},
		},
	},
	keys = {
		{ "<leader>e", desc = "nvim-tree" },
	},
}