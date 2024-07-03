return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      routes = {
        -- Show @recording messages
        -- {
        --   view = "notify",
        --   filter = { event = "msg_showmode" },
        -- },
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            kind = "search_count",
          },
          opts = { skip = true },
        },
      },
      views = {
        cmdline_popup = {
          position = {
            row = 5,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
        },
        popupmenu = {
          relative = "editor",
          position = {
            row = 8,
            col = "50%",
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
          },
        },
      },
      -- mode = "showmode",
      -- -- messages = {
      -- --   enabled = true, -- enables the Noice messages UI
      -- --   view = true, -- default view for messages
      -- --   view_error = true, -- view for errors
      -- --   view_warn = true, -- view for warnings
      -- --   view_history = false, -- view for :messages
      -- --   view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
      -- -- },
      -- -- add any options here
      -- presets = {
      --   lsp_doc_border = true,
      -- },
      builtin = {
        border = "rounded",
      },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        -- bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- "rcarriga/nvim-notify",
    },
  },
}
