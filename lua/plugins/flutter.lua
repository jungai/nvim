return {
  {
    "akinsho/flutter-tools.nvim",
    ft = "dart",
    dependencies = { "telescope.nvim" },
    config = function()
      require("telescope").load_extension "flutter"
    end,
  },
}
