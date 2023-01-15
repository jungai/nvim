return {
	{
		"mason",
		lazy = true,
		config = true,
	},
	{
		"mason-lspconfig",
		lazy = true,
		opts = {
			ensure_installed = {
				"tsserver",
				"html",
				"cssls",
				"tailwindcss",
				"sumneko_lua",
				"emmet_ls",
				"bashls",
				"astro",
				"dockerls",
				"elixirls",
				"gopls",
				"graphql",
				"jsonls",
				"marksman",
				"prismals",
				"svelte",
				"terraformls",
				"volar",
				"yamlls",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		},
	},

	{
		"mason-null-ls",
		lazy = true,
		opts = {
			ensure_installed = {
				-- "prettier", -- ts/js formatter
				"prettierd", -- ts/js formatter
				"stylua", -- lua formatter
				"eslint_d", -- ts/js linter
			},
			-- auto-install configured formatters & linters (with null-ls)
			automatic_installation = true,
		},
	},
}