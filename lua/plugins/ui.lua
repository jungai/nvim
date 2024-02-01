return {
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    opts = {
      timeout = 500,
      max_height = function()
        return math.floor(vim.o.lines * 0.5)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.5)
      end,
      render = "compact",
    },
  },

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
      -- mode = "showmode",
      -- -- messages = {
      -- --   enabled = true, -- enables the Noice messages UI
      -- --   view = true, -- default view for messages
      -- --   view_error = true, -- view for errors
      -- --   view_warn = true, -- view for warnings
      -- --   view_history = false, -- view for :messages
      -- --   view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
      -- -- },
      -- -- add any options here
      -- presets = {
      --   lsp_doc_border = true,
      -- },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
}