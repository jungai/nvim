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
      "gleam-lang/gleam.vim",
    },
    config = function()
      local lspconfig = require "lspconfig"

      local keymap = vim.keymap -- for conciseness

      local on_attach = function(client, bufnr)
        -- keybind options
        local opts = { noremap = true, silent = true, buffer = bufnr }

        -- set keybinds
        -- keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
        keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
        -- keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts) -- see definition and make edits in window
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        -- keymap.set("n", "gp", "<cmd>Lspsaga peek_type_definition<CR>", opts) -- see definition and make edits in window
        keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
        keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
        -- keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        -- keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        -- keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
        keymap.set("n", "<leader>D", vim.diagnostic.open_float, opts)
        -- keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
        keymap.set("n", "<leader>d", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
        -- keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
        -- keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        -- keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
        keymap.set("n", "K", vim.lsp.buf.hover, opts)
        -- keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side
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
        settings = {
          tailwindCSS = {
            experimental = {
              classRegex = {
                "tw`([^`]*)",
                "tw\\.style\\(([^)]*)\\)",
                'tw="([^"]*)',
                'tw={"([^"}]*)',
                "tw\\.\\w+`([^`]*)",
                "tw\\(.*?\\)`([^`]*)",
                { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                { "cn\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
              },
            },
            classAttributes = {
              "class",
              "className",
              "ngClass",
              "style",
            },
          },
        },
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

      lspconfig["biome"].setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      lspconfig["gleam"].setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      -- TODO: loop this lsp config
      -- lspconfig["rome"].setup {
      --   capabilities = capabilities,
      --   on_attach = on_attach,
      -- }

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
      "WhoIsSethDaniel/mason-tool-installer.nvim",
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
        },

        -- auto-install configured servers (with lspconfig)
        automatic_installation = false, -- not the same as ensure_installed
      }

      local mason_tool_installer = require "mason-tool-installer"
      mason_tool_installer.setup {
        ensure_installed = {
          "prettier",
          "prettierd",
          "biome",
          "codespell",
          "stylua",
          "eslint_d",
        },
      }
    end,
  },

  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      linters = {
        eslint_d = {
          args = {
            "--no-warn-ignored", -- <-- this is the key argument
            "--format",
            "json",
            "--stdin",
            "--stdin-filename",
            function()
              return vim.api.nvim_buf_get_name(0)
            end,
          },
        },
      },
      linters_by_ft = {
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
      },
    },
    config = function(_, opts)
      local lint = require "lint"
      lint.linters = opts.linters
      lint.linters_by_ft = opts.linters_by_ft

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim.create_autocmd {
        "BufEnter",
        "BufWritePost",
        "InsertLeave",
        {
          group = lint_augroup,
          callback = function()
            lint.try_lint()
          end,
        },
      }

      vim.keymap.set("n", "<leader>l", function()
        lint.try_lint()
      end, { desc = "Try to linting for current file", noremap = true, silent = true })
    end,
  },

  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 3000,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { { "biome", "prettierd", "prettier" } },
        javascriptreact = { { "biome", "prettierd", "prettier" } },
        typescript = { { "biome", "prettierd", "prettier" } },
        typescriptreact = { { "biome", "prettierd", "prettier" } },
        json = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        jsonc = { "prettierd" },
        markdown = { "prettierd" },
        ["markdown.mdx"] = { "prettierd" },
        svelte = { "prettierd" },
        astro = { "prettierd" },
        vue = { "prettierd" },
        ["*"] = { "codespell" },
      },
    },
  },
}
