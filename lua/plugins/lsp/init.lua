return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp",
      "jose-elias-alvarez/typescript.nvim",
      "akinsho/flutter-tools.nvim",
    },
    config = function()
      local lspconfig = require "lspconfig"

      local keymap = vim.keymap -- for conciseness

      local on_attach = function(client, bufnr)
        -- keybind options
        local opts = { noremap = true, silent = true, buffer = bufnr }

        -- set keybinds
        keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
        keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
        keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts) -- see definition and make edits in window
        keymap.set("n", "gp", "<cmd>Lspsaga peek_type_definition<CR>", opts) -- see definition and make edits in window
        keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
        keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
        keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
        keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
        keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
        keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
        keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
        keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
        keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side
        keymap.set("n", "gr", vim.lsp.buf.references, opts)
        -- typescript specific keymaps (e.g. rename file and update imports)
        if client.name == "tsserver" then
          keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
          keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
          keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
        end
      end

      -- used to enable autocompletion (assign to every lsp server config)
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- configure html server
      lspconfig["html"].setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      -- configure typescript server with plugin
      require("typescript").setup {
        server = {
          capabilities = capabilities,
          on_attach = on_attach,
        },
      }

      -- configure css server
      lspconfig["cssls"].setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      -- configure tailwindcss server
      lspconfig["tailwindcss"].setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      -- configure emmet language server
      lspconfig["emmet_ls"].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
      }

      lspconfig["astro"].setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      -- configure lua server (with special settings)
      lspconfig["lua_ls"].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = { -- custom settings for lua
          Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              -- make language server aware of runtime files
              library = {
                [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                [vim.fn.stdpath "config" .. "/lua"] = true,
              },
            },
          },
        },
      }

      lspconfig["jsonls"].setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      lspconfig["prismals"].setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      lspconfig["dockerls"].setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      lspconfig["svelte"].setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      lspconfig["volar"].setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      -- TODO: loop this lsp config
      lspconfig["rome"].setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      vim.diagnostic.config {
        virtual_text = {
          prefix = "●",
        },
        update_in_insert = true,
        float = {
          source = "always", -- Or "if_many"
        },
      }

      require("flutter-tools").setup {
        -- flutter_path = "/Users/jungai/.asdf/installs/flutter/3.3.2-stable",
        -- debugger = {
        -- 	enabled = true,
        -- 	run_via_dap = true,
        -- },
        outline = { auto_open = false },
        widget_guides = { enabled = true, debug = true },
        dev_log = { enabled = true, open_cmd = "30vnew", auto_open = true },
        lsp = {
          color = {
            enabled = true,
            background = true,
            virtual_text = false,
          },
          settings = {
            showTodos = true,
            renameFilesWithClasses = "prompt",
          },
          on_attach = on_attach,
          capabilities = capabilities,
        },
        settings = {
          enableSnippets = true,
        },
      }
    end,
  },

  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "jay-babu/mason-null-ls.nvim",
    },
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup {
        -- list of servers for mason to install
        ensure_installed = {
          "tsserver",
          "html",
          "cssls",
          "tailwindcss",
          "lua_ls",
          "emmet_ls",
          "bashls",
          "astro",
          "dockerls",
          "elixirls",
          -- "gopls",
          "graphql",
          "jsonls",
          "marksman",
          "prismals",
          "svelte",
          -- "terraformls",
          "volar",
          "yamlls",
          "rome",
        },
        -- auto-install configured servers (with lspconfig)
        automatic_installation = true, -- not the same as ensure_installed
      }
      require("mason-null-ls").setup {
        -- list of formatters & linters for mason to install
        ensure_installed = {
          -- "prettier", -- ts/js formatter
          "prettierd", -- ts/js formatter
          "stylua", -- lua formatter
          "eslint_d", -- ts/js linter
          -- "misspell",
        },
        -- auto-install configured formatters & linters (with null-ls)
        automatic_installation = true,
      }
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require "null-ls"
      local file_types = {
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "vue",
          "css",
          "scss",
          "less",
          "html",
          "json",
          "jsonc",
          "yaml",
          "markdown",
          "markdown.mdx",
          "graphql",
          "handlebars",
          "svelte",
          "astro",
        },
      }
      -- for conciseness
      local formatting = nls.builtins.formatting -- to setup formatters
      local diagnostics = nls.builtins.diagnostics -- to setup linters

      -- to setup format on save
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      return {
        sources = {
          -- --  to disable file types use
          --  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
          -- formatting.prettier.with(file_types), -- js/ts formatter
          formatting.prettierd.with(file_types),
          formatting.stylua, -- lua formatter
          formatting.dart_format,
          diagnostics.eslint_d.with { -- js/ts linter
            -- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
            filetypes = file_types,
            condition = function(utils)
              return utils.root_has_file ".eslintrc.js" -- change file extension if you use something else
            end,
          },
          diagnostics.misspell,
        },
        -- configure format on save
        on_attach = function(current_client, bufnr)
          if current_client.supports_method "textDocument/formatting" then
            vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format {
                  filter = function(client)
                    --  only use null-ls for formatting instead of lsp server
                    return client.name == "null-ls"
                  end,
                  bufnr = bufnr,
                }
              end,
            })
          end
        end,
      }
    end,
  },
}