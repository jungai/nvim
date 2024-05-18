return {
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    keys = {
      {
        "<leader>ha",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = "Harpoon Mark",
      },
      {
        "<leader>hh",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "Harpoon Menu",
      },
      {
        "<leader>k",
        function()
          require("harpoon.ui").nav_next()
        end,
        desc = "Harpoon Go Next Mark",
      },
      {
        "<leader>j",
        function()
          require("harpoon.ui").nav_prev()
        end,
        desc = "Harpoon Go Previous Mark",
      },
    },
    opts = {
      filters = {
        dotfiles = false,
        git_clean = false,
      },
      git = {
        ignore = false,
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
    },
  },
}
