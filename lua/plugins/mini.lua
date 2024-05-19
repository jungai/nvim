return {
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  },
  {
    "echasnovski/mini.indentscope",
    version = "*",
    event = "BufReadPre",
    opts = {
      symbol = "│",
    },
  },
}