return {
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
      float = {
        -- Padding around the floating window
        padding = 2,
        max_width = 0,
        max_height = 0,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        override = function(conf)
          return conf
        end,
      },
    },
  },
}
