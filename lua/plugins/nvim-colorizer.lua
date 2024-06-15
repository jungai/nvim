return {
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   name = "colorizer",
  --   event = "BufReadPre",
  --   config = function()
  --     require("colorizer").attach_to_buffer(0, { mode = "background", css = true, tailwind = "both" })
  --   end,
  -- },
  {
    "js-everts/cmp-tailwind-colors",
    -- optionally, override the default options:
    event = "BufReadPre",
    opts = {
      enable_alpha = true, -- requires pumblend > 0.
      format = function(itemColor)
        return {
          fg = itemColor,
          bg = itemColor, -- or nil if you dont want a background color
          text = "  ", -- or use an icon
        }
      end,
    },
  },
}
