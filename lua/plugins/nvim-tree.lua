return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    keys = {
      { "<leader>e", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Explorer NeoTree (root dir)", remap = true },
      { "<leader>-", "<cmd>NvimTreeCollapse<cr>", desc = "Collapse NeoTree", remap = true },
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
      view = {
        adaptive_size = true,
        float = {
          enable = true,
        },
        side = "right",
      },
    },
  },
}
