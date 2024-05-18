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
}
