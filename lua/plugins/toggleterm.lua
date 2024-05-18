return {
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
}
