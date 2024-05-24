return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    keys = {
      { "<leader_>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader_>fs", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader_>fc,", "<cmd>Telescope grep_string<cr>", desc = "Grep String" },
      { "<leader_>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader_>fu", "<cmd>Telescope buffers flutter commands<cr>", desc = "Flutter Commands" },
    },
    opts = {
      -- configure custom mappings
      defaults = {
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        -- sorting_strategy = "ascending",
        -- layout_strategy = "horizontal",
        layout_config = {
          -- horizontal = {
          --   prompt_position = "top",
          --   preview_width = 0.55,
          --   results_width = 0.8,
          -- },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        border = {},
        -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        mappings = {
          i = {
            ["<C-k>"] = function()
              return require("telescope.actions").move_selection_previous
            end, -- move to prev result
            ["<C-j>"] = function()
              return require("telescope.actions").move_selection_next
            end, -- move to next result
          },
        },
        file_ignore_patterns = {
          "node_modules",
          ".git/",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          previewer = true,
          find_command = { "rg", "--hidden", "--files" },
        },
        live_grep = {
          hidden = true,
        },
        file_browser = {
          hidden = true,
        },
      },
    },
  },
}
