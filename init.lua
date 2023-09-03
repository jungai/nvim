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
  { import = "plugins" },
}