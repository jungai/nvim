return {
  {
    "windwp/windline.nvim",
    event = "BufRead",
    opts = {},
    config = function()
      require "wlsample.airline"
    end,
  },
}
