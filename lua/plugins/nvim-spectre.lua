return {
  {
    "windwp/nvim-spectre",
		-- stylua: ignore
		keys = {
			{ "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
			{ "<leader>sc", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', desc = "Replace in files (Spectre)" },
		},
  },
}
