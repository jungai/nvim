return {
  -- {
  --   "windwp/windline.nvim",
  --   event = "BufRead",
  --   opts = {},
  --   config = function()
  --     require "wlsample.airline"
  --   end,
  -- },
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
}
