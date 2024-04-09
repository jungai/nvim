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
  {
    "folke/tokyonight.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      local bg = "#011628"
      local bg_dark = "#011423"
      local bg_highlight = "#143652"
      local bg_search = "#0A64AC"
      local bg_visual = "#275378"
      local fg = "#CBE0F0"
      local fg_dark = "#B4D0E9"
      local fg_gutter = "#627E97"
      local border = "#547998"

      require("tokyonight").setup {
        style = "moon",
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = false },
          keywords = { italic = false },
          functions = {},
          variables = {},
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "dark", -- style for sidebars, see below
          floats = "dark", -- style for floating windows
        },
        -- transparent = true,
        -- on_colors = function(colors)
        --   colors.bg = bg
        --   colors.bg_dark = bg_dark
        --   colors.bg_float = bg_dark
        --   colors.bg_highlight = bg_highlight
        --   colors.bg_popup = bg_dark
        --   colors.bg_search = bg_search
        --   colors.bg_sidebar = bg_dark
        --   colors.bg_statusline = bg_dark
        --   colors.bg_visual = bg_visual
        --   colors.border = border
        --   colors.fg = fg
        --   colors.fg_dark = fg_dark
        --   colors.fg_float = fg
        --   colors.fg_gutter = fg_gutter
        --   colors.fg_sidebar = fg_dark
        -- end,
      }
    end,
  },
  -- { "catppuccin/nvim", name = "catppuccin", priority = 1000, event = "VimEnter" },
  { import = "plugins" },
}

vim.cmd [[colorscheme tokyonight]]
