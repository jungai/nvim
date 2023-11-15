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
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.nightflyCursorColor = true
      vim.g.nightflyTransparent = false
      vim.g.nightflyVirtualTextColor = true
      vim.cmd [[colorscheme nightfly]]
    end,
  },
  { import = "plugins" },
}