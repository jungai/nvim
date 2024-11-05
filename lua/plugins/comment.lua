return {
  -- {
  --   "numToStr/Comment.nvim",
  --   keys = { "gcc" },
  --   config = function()
  --     require("Comment").setup {
  --       pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  --     }
  --   end,
  -- },
  {
    "echasnovski/mini.comment",
    version = "*",
    keys = { "gcc" },
    config = function()
      require("mini.comment").setup {
        options = {
          custom_commentstring = function()
            return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
          end,
        },
      }
    end,
  },
}
