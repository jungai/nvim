return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- last release is way too old and doesn't work on Windows
		build = ":TSUpdate",
		event = "BufReadPost",
		dependencies = { { "windwp/nvim-ts-autotag", config = true } },
		keys = {
			{ "<c-space>", desc = "Increment selection" },
			{ "<bs>", desc = "Schrink selection", mode = "x" },
		},
		---@type TSConfig
		opts = {
			highlight = { enable = true },
			indent = { enable = true },
			auto_install = true,
			autotag = {
				enable = true,
			},
			context_commentstring = { enable = true, enable_autocmd = false },
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"markdown",
				"svelte",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"vue",
				"fish",
				"go",
				"http",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = "<nop>",
					node_decremental = "<bs>",
				},
			},
		},
		---@param opts TSConfig
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
