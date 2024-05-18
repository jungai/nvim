return {
  {
    "sindrets/diffview.nvim",
    event = "BufReadPre",
  },
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = "LazyGit",
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open Lazygit", remap = true },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {
      current_line_blame = true,
      signs = {
        add = { text = "+" },
        change = { text = "M" },
        delete = { text = "-" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
    },
  },
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" },
  },
}
