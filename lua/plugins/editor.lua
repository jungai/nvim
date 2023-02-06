return {
	{
		"nvim-tree/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		keys = {
			{ "<leader>e", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Explorer NeoTree (root dir)", remap = true },
		},
		opts = {
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
		},
	},

	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = "BufReadPre",
		opts = {
			-- symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
		},
		config = function(_, opts)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
			require("mini.indentscope").setup(opts)
		end,
	},

	{
		"windwp/nvim-spectre",
		-- stylua: ignore
		keys = {
			{ "<leader_>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
		},
	},

	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		version = false,
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
		keys = {
			{ "<leader_>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
			{ "<leader_>fs", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
			{ "<leader_>fc,", "<cmd>Telescope grep_string<cr>", desc = "Grep String" },
			{ "<leader_>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ "<leader_>fu", "<cmd>Telescope buffers flutter commands<cr>", desc = "Flutter Commands" },
		},
		opts = {
			-- configure custom mappings
			defaults = {
				borderchars = {
					prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
					results = { " " },
					preview = { " " },
				},
				mappings = {
					i = {
						["<C-k>"] = function()
							return require("telescope.actions").move_selection_previous
						end, -- move to prev result
						["<C-j>"] = function()
							return require("telescope.actions").move_selection_next
						end, -- move to next result
					},
				},
				file_ignore_patterns = {
					"node_modules",
					".git/",
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
				live_grep = {
					hidden = true,
				},
				file_browser = {
					hidden = true,
				},
			},
		},
	},

	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = "BufReadPost",
		config = true,
		-- stylua: ignore
		keys = {
			{ "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
			{ "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
			{ "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
			{ "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
			{ "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
		},
	},

	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		opts = { use_diagnostic_signs = true },
		keys = {
			{ "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
			{ "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
		},
	},

	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		opts = {
			current_line_blame = true,
		},
	},

	{
		"ggandor/leap.nvim",
		event = "VeryLazy",
		dependencies = { { "ggandor/flit.nvim", opts = { labeled_modes = "nv" } } },
		config = function(_, opts)
			local leap = require("leap")
			for k, v in pairs(opts) do
				leap.opts[k] = v
			end
			leap.add_default_mappings(true)
		end,
	},

	{
		"telescope.nvim",
		dependencies = {
			"akinsho/flutter-tools.nvim",
			config = function()
				require("telescope").load_extension("flutter")
			end,
		},
	},

	{
		"tpope/vim-fugitive",
		cmd = { "Git", "G" },
	},

	{
		"gpanders/editorconfig.nvim",
		event = "VeryLazy",
	},

	{
		"mg979/vim-visual-multi",
		event = "VeryLazy",
	},
}