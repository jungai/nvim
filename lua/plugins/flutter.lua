return {
  {
    "telescope.nvim",
    ft = "dart",
    dependencies = {
      "akinsho/flutter-tools.nvim",
      config = function()
        require("telescope").load_extension "flutter"
      end,
    },
  },
}
