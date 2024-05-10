return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    keys = {
      { "<leader>e", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Explorer NeoTree (root dir)", remap = true },
      { "<leader>-", "<cmd>NvimTreeCollapse<cr>", desc = "Collapse NeoTree", remap = true },
    },
    opts = {
      filters = {
        dotfiles = false,
        git_clean = false,
      },
      git = {
        ignore = false,
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      view = {
        adaptive_size = true,
        float = {
          enable = true,
        },
      },
    },
  },
  {
    "echasnovski/mini.indentscope",
    version = "*",
    event = "BufReadPre",
    opts = {
      symbol = "│",
    },
  },

  -- {
  --   -- indent guides for Neovim
  --   "lukas-reineke/indent-blankline.nvim",
  --   config = function()
  --     -- local highlight = {
  --     --   "RainbowRed",
  --     --   "RainbowYellow",
  --     --   "RainbowBlue",
  --     --   "RainbowTeal",
  --     --   "RainbowGreen",
  --     --   "RainbowOrange",
  --     --   "RainbowCyan",
  --     -- }
  --     --
  --     -- local hooks = require "ibl.hooks"
  --     -- -- create the highlight groups in the highlight setup hook, so they are reset
  --     -- -- every time the colorscheme changes
  --     -- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  --     --   vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#ea6962" })
  --     --   vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#fabd2f" })
  --     --   vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#458588" })
  --     --   vim.api.nvim_set_hl(0, "RainbowTeal", { fg = "#8ec07c" })
  --     --   vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#b8bb26" })
  --     --   vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#e78a4e" })
  --     --   vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#83a598" })
  --     -- end)
  --
  --     local ibl = require "ibl"
  --     ibl.setup {
  --       indent = {
  --         char = "│",
  --         tab_char = "│",
  --       },
  --       scope = {
  --         enabled = true,
  --       },
  --       vim.opt.listchars:append "space: ",
  --     }
  --   end,
  -- },
  -- {
  --   "echasnovski/mini.indentscope",
  --   version = false, -- wait till new 0.7.0 release to put it back on semver
  --   event = "BufReadPre",
  --   opts = {
  --     -- symbol = "▏",
  --     symbol = "│",
  --     options = { try_as_border = true },
  --   },
  --   config = function(_, opts)
  --     vim.api.nvim_create_autocmd("FileType", {
  --       pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
  --       callback = function()
  --         vim.b.miniindentscope_disable = true
  --       end,
  --     })
  --     require("mini.indentscope").setup(opts)
  --   end,
  -- },

  {
    "windwp/nvim-spectre",
		-- stylua: ignore
		keys = {
			{ "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
			{ "<leader>sc", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', desc = "Replace in files (Spectre)" },
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
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        -- sorting_strategy = "ascending",
        -- layout_strategy = "horizontal",
        layout_config = {
          -- horizontal = {
          --   prompt_position = "top",
          --   preview_width = 0.55,
          --   results_width = 0.8,
          -- },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        border = {},
        -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
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
          previewer = false,
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
      signs = {
        add = { text = "+" },
        change = { text = "M" },
        delete = { text = "-" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
    },
  },

  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    dependencies = { { "ggandor/flit.nvim", opts = { labeled_modes = "nv" } } },
    config = function(_, opts)
      local leap = require "leap"
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
        require("telescope").load_extension "flutter"
      end,
    },
  },

  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" },
  },
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
  },

  -- {
  --   "rest-nvim/rest.nvim",
  --   branch = "main",
  --   name = "rest",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   event = "VeryLazy",
  --   opts = {
  --     -- Open request results in a horizontal split
  --     result_split_horizontal = false,
  --     -- Keep the http file buffer above|left when split horizontal|vertical
  --     result_split_in_place = false,
  --     -- Skip SSL verification, useful for unknown certificates
  --     skip_ssl_verification = false,
  --     -- Encode URL before making request
  --     encode_url = true,
  --     -- Highlight request on run
  --     highlight = {
  --       enabled = true,
  --       timeout = 150,
  --     },
  --     result = {
  --       -- toggle showing URL, HTTP info, headers at top the of result window
  --       show_url = true,
  --       show_http_info = true,
  --       show_headers = true,
  --       -- executables or functions for formatting response body [optional]
  --       -- set them to nil if you want to disable them
  --       formatters = {
  --         json = "jq",
  --         html = function(body)
  --           return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
  --         end,
  --       },
  --     },
  --     -- Jump to request line on run
  --     jump_to_request = false,
  --     env_file = ".env",
  --     custom_dynamic_variables = {},
  --     yank_dry_run = true,
  --   },
  --   config = function(_, opts)
  --     require("rest").setup(opts)
  --   end,
  -- },

  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    opts = { delay = 200 },
    config = function(_, opts)
      require("illuminate").configure(opts)
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          pcall(vim.keymap.del, "n", "]]", { buffer = buffer })
          pcall(vim.keymap.del, "n", "[[", { buffer = buffer })
        end,
      })
    end,
  -- stylua: ignore
  keys = {
    { "]]", function() require("illuminate").goto_next_reference(false) end, desc = "Next Reference", },
    { "[[", function() require("illuminate").goto_prev_reference(false) end, desc = "Prev Reference" },
  },
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = "ToggleTerm",
    keys = {
      { "<leader>tt", "<cmd>ToggleTerm size=40 direction=float<cr>", mode = "n", desc = "Open Terminal" },
    },
    opts = {
      autochdir = true,
    },
  },

  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    keys = {
      { "-", "<cmd>Oil<cr>", mode = "n", desc = "Open parent directory" },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = true,
  },
  {
    "tomiis4/Hypersonic.nvim",
    event = "CmdlineEnter",
    cmd = "Hypersonic",
    config = function()
      require("hypersonic").setup {
        -- config
      }
    end,
  },
  {
    "chiedo/vim-case-convert",
    event = "VeryLazy",
  },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   event = "BufRead",
  --   config = function()
  --     vim.opt.list = true
  --     vim.opt.listchars:append "eol:↴"
  --
  --     require("indent_blankline").setup {
  --       show_end_of_line = true,
  --     }
  --   end,
  -- },
  -- {
  --   "folke/flash.nvim",
  --   event = "VeryLazy",
  --   ---@type Flash.Config
  --   opts = {},
  -- -- stylua: ignore
  -- keys = {
  --   { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  --   { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  --   { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
  --   { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
  --   { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  -- },
  -- },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        panel = {
          auto_refresh = true,
        },
        suggestion = {
          auto_trigger = true,
          debounce = 40,
        },
      }
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
  },
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = "LazyGit",
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open Lazygit", remap = true },
    },
  },

  {
    "ThePrimeagen/harpoon",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    keys = {
      {
        "<leader>ha",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = "Harpoon Mark",
      },
      {
        "<leader>hh",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "Harpoon Menu",
      },
      {
        "<leader>k",
        function()
          require("harpoon.ui").nav_next()
        end,
        desc = "Harpoon Go Next Mark",
      },
      {
        "<leader>j",
        function()
          require("harpoon.ui").nav_prev()
        end,
        desc = "Harpoon Go Previous Mark",
      },
    },
    opts = {
      filters = {
        dotfiles = false,
        git_clean = false,
      },
      git = {
        ignore = false,
      },
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
    "levouh/tint.nvim",
    event = "BufReadPre",
    config = true,
  },
  -- {
  --   "dmmulroy/ts-error-translator.nvim",
  --   event = "BufReadPre",
  --   config = true,
  -- },
  {
    "js-everts/cmp-tailwind-colors",
    -- optionally, override the default options:
    event = "BufReadPre",
    opts = {
      enable_alpha = true, -- requires pumblend > 0.
      format = function(itemColor)
        return {
          fg = itemColor,
          bg = itemColor, -- or nil if you dont want a background color
          text = "  ", -- or use an icon
        }
      end,
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    name = "colorizer",
    event = "BufReadPre",
    config = function()
      require("colorizer").attach_to_buffer(0, { mode = "background", css = true, tailwind = "both" })
    end,
  },
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = {
      { "<leader>ut", "<cmd>UndotreeToggle<cr>", desc = "Undotree Toggle", remap = true },
    },
  },
}
