return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  -- lazy = true,
  -- ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    "BufReadPre ~/Desktop/obsidian/**.md",
    "BufNewFile ~/Desktop/obsidian/**.md",
  },
  keys = {
    { "<leader>on", "<cmd>ObsidianNew<cr>", mode = "n", desc = "Create New Obsidian Note" },
    { "<leader>os", "<cmd>ObsidianSearch<cr>", mode = "n", desc = "Search Note in vault" },
    { "<leader>ot", "<cmd>ObsidianTags<cr>", mode = "n", desc = "List of all given tags" },
    { "<leader>odt", "<cmd>ObsidianToday<cr>", mode = "n", desc = "Open/Create a new daily note" },
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Desktop/obsidian",
      },
    },

    daily_notes = {
      folder = "dailies",
      date_format = "%d-%m-%Y",
      alias_format = "%B %-d, %Y",
      template = "daily.md",
    },
    templates = {
      folder = "templates",
      date_format = "%d-%m-%Y",
      time_format = "%H:%M",
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
    },
  },
}
