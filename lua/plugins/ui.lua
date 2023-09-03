return {
  -- {
  --   "rcarriga/nvim-notify",
  --   keys = {
  --     {
  --       "<leader>un",
  --       function()
  --         require("notify").dismiss { silent = true, pending = true }
  --       end,
  --       desc = "Delete all Notifications",
  --     },
  --   },
  --   opts = {
  --     timeout = 3000,
  --     max_height = function()
  --       return math.floor(vim.o.lines * 0.75)
  --     end,
  --     max_width = function()
  --       return math.floor(vim.o.columns * 0.75)
  --     end,
  --   },
  -- },
  --
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
      },
    },
  },

  { "nvim-tree/nvim-web-devicons", lazy = true },

  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    opts = {
      definition = {
        edit = "<Cr>",
        quit = "q",
        close = "<Esc>",
      },
    },
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function(_, opts)
      local lualine = require "lualine"
      lualine.setup(opts)
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
    },
  },
}