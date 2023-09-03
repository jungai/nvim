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
  -- {
  --   "EdenEast/nightfox.nvim",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   opts = {
  --     options = {
  --       transparent = true,
  --       styles = {
  --         comments = "italic",
  --         keywords = "bold",
  --         types = "italic,bold",
  --       },
  --     },
  --   },
  --   config = function(_, opts)
  --     require("nightfox").setup(opts)
  --     vim.cmd "colorscheme Duskfox"
  --   end,
  -- },
  --
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("rose-pine").setup {
        disable_italics = true,
        dim_nc_background = true,
        disable_background = true,
      }
      vim.cmd "colorscheme rose-pine"
    end,
  },
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
  -- {
  --   "bluz71/vim-nightfly-colors",
  --   name = "nightfly",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.g.nightflyTransparent = true
  --     vim.g.nightflyVirtualTextColor = true
  --     vim.cmd [[colorscheme nightfly]]
  --   end,
  -- },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd [[colorscheme tokyonight-moon]]
  --   end,
  -- },

  -- {
  --   "tjdevries/gruvbuddy.nvim",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   dependencies = { "tjdevries/colorbuddy.nvim" },
  --   config = function()
  --     require("colorbuddy").colorscheme "gruvbuddy"
  --   end,
  -- },
  -- {
  -- {
  --   "lalitmee/cobalt2.nvim",
  --   event = { "ColorSchemePre" }, -- if you want to lazy load
  --   dependencies = { "tjdevries/colorbuddy.nvim" },
  --   init = function()
  --     require("colorbuddy").colorscheme "cobalt2"
  --   end,
  -- },
  -- {
  --   "oxfist/night-owl.nvim",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     -- load the colorscheme here
  --     vim.cmd.colorscheme "night-owl"
  --   end,
  -- },
  { import = "plugins" },
}