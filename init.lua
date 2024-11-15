require "jungai/options"
require "jungai/keymaps"

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
  --     vim.g.nightflyTransparent = false
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
  -- {
  --   "Shatur/neovim-ayu",
  --   name = "ayu",
  --   priority = 1000,
  --   opts = {
  -- overrides = {
  --   Normal = { bg = "None" },
  --   ColorColumn = { bg = "None" },
  --   SignColumn = { bg = "None" },
  --   Folded = { bg = "None" },
  --   FoldColumn = { bg = "None" },
  --   CursorLine = { bg = "None" },
  --   CursorColumn = { bg = "None" },
  --   WhichKeyFloat = { bg = "None" },
  --   VertSplit = { bg = "None" },
  -- },
  --   },
  -- },
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   opts = {
  --     -- variant = "moon", -- auto, main, moon, or dawn
  --     -- dark_variant = "moon", -- main, moon, or dawn
  --     styles = {
  --       bold = true,
  --       italic = false,
  --       transparency = true,
  --     },
  --   },
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
  -- {
  --   "folke/tokyonight.nvim",
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   opts = {
  --     style = "moon",
  --   },
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    event = "VimEnter",
    opts = {
      styles = {
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = { "italic" },
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = { "italic" },
        properties = {},
        types = {},
        operators = {},
      },
      integrations = {
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
      },
    },
  },
  { import = "plugins" },
}

vim.cmd [[colorscheme catppuccin-macchiato]]
-- vim.cmd [[colorscheme kanagawa-dragon]]
-- vim.cmd [[colorscheme catppuccin]]
-- vim.cmd [[colorscheme tokyonight]]
-- vim.cmd [[colorscheme nightfall]]
