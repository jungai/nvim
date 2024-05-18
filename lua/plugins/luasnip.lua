return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    -- stylua: ignore
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true, silent = true, mode = "i",
      },
      { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
    config = function(_, opts)
      local luasnip = require "luasnip"
      luasnip.setup(opts)
      luasnip.filetype_extend("dart", { "flutter" })
    end,
  },
}
