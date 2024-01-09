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
  --   "EdenEast/nightfox.nvim",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require("nightfox").setup {
  --       options = {
  --         transparent = true,
  --       },
  --     }
  --     vim.cmd "colorscheme duskfox"
  --   end,
  -- },
  -- {
  --   "bluz71/vim-nightfly-colors",
  --   name = "nightfly",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.g.nightflyCursorColor = true
  --     vim.g.nightflyTransparent = true
  --     vim.g.nightflyVirtualTextColor = true
  --     vim.cmd [[colorscheme nightfly]]
  --   end,
  -- },
  -- {
  --   "Mofiqul/dracula.nvim",
  --   lazy = false,
  --   priority = 1000,
  -- },
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   opts = {
  --     transparent_background = true,
  --   },
  -- },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      variant = "moon", -- auto, main, moon, or dawn
      dark_variant = "moon", -- main, moon, or dawn
      styles = {
        transparency = true,
      },
    },
  },
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

vim.cmd [[colorscheme rose-pine]]