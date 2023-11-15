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
  -- {
  --   "akinsho/bufferline.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     options = {
  --       diagnostics = "nvim_lsp",
  --       always_show_bufferline = false,
  --     },
  --   },
  -- },

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
    config = function()
      local lualine = require "lualine"
      lualine.setup {
        sections = {
          lualine_x = {
            {
              require("noice").api.status.message.get_hl,
              cond = require("noice").api.status.message.has,
            },
            {
              require("noice").api.status.command.get,
              cond = require("noice").api.status.command.has,
              color = { fg = "#ff9e64" },
            },
            {
              require("noice").api.status.mode.get,
              cond = require("noice").api.status.mode.has,
              color = { fg = "#ff9e64" },
            },
            {
              require("noice").api.status.search.get,
              cond = require("noice").api.status.search.has,
              color = { fg = "#ff9e64" },
            },
          },
        },
      }
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      mode = "showmode",
      messages = {
        enabled = true, -- enables the Noice messages UI
        view = false, -- default view for messages
        view_error = false, -- view for errors
        view_warn = false, -- view for warnings
        view_history = false, -- view for :messages
        view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
      },
      -- add any options here
      presets = {
        lsp_doc_border = true,
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
    },
  },
}