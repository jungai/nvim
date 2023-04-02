require "config/options"
require "config/keymaps"

vim.g.mapleader = " "
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  -- {
  --   "Mofiqul/vscode.nvim",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   opts = {
  --     italic_comments = true,
  --   },
  --   config = function(_, opts)
  --     local vscode = require "vscode"
  --     vscode.setup(opts)
  --     vscode.load()
  --   end,
  -- },
  {
    "EdenEast/nightfox.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
      options = {
        transparent = true,
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "italic,bold",
        },
      },
    },
    config = function(_, opts)
      require("nightfox").setup(opts)
      vim.cmd "colorscheme Duskfox"
    end,
  },
  --
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     vim.cmd "colorscheme rose-pine"
  --   end,
  -- },
  -- {
  --   "svrana/neosolarized.nvim",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = true,
  --   dependencies = { "tjdevries/colorbuddy.nvim" },
  --   opts = {
  --     comment_italics = true,
  --     background_set = true,
  --   },
  -- },
  { import = "plugins" },
}