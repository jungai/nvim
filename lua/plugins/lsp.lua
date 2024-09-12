local lspList = {
  "ts_ls",
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
  "biome",
  "yamlls",
  "pyright",
  "rust_analyzer",
  "nil_ls",
}

local kind_icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰇽",
  Variable = "󰂡",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲",
}

return {
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "onsails/lspkind.nvim",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function()
      require("luasnip.loaders.from_vscode").lazy_load()

      local lspkind_comparator = function(conf)
        local lsp_types = require("cmp.types").lsp
        return function(entry1, entry2)
          if entry1.source.name ~= "nvim_lsp" then
            if entry2.source.name == "nvim_lsp" then
              return false
            else
              return nil
            end
          end
          local kind1 = lsp_types.CompletionItemKind[entry1:get_kind()]
          local kind2 = lsp_types.CompletionItemKind[entry2:get_kind()]
          if kind1 == "Variable" and entry1:get_completion_item().label:match "%w*=" then
            kind1 = "Parameter"
          end
          if kind2 == "Variable" and entry2:get_completion_item().label:match "%w*=" then
            kind2 = "Parameter"
          end

          local priority1 = conf.kind_priority[kind1] or 0
          local priority2 = conf.kind_priority[kind2] or 0
          if priority1 == priority2 then
            return nil
          end
          return priority2 < priority1
        end
      end

      local label_comparator = function(entry1, entry2)
        return entry1.completion_item.label < entry2.completion_item.label
      end
      local cmp = require "cmp"
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
          ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
          ["<C-e>"] = cmp.mapping.abort(), -- close completion window
          ["<CR>"] = cmp.mapping.confirm { select = false },
        },
        sources = cmp.config.sources {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
        -- https://github.com/hrsh7th/nvim-cmp/issues/156#issuecomment-916338617
        comparators = {
          lspkind_comparator {
            kind_priority = {
              Parameter = 14,
              Variable = 12,
              Field = 11,
              Property = 11,
              Constant = 10,
              Enum = 10,
              EnumMember = 10,
              Event = 10,
              Function = 10,
              Method = 10,
              Operator = 10,
              Reference = 10,
              Struct = 10,
              File = 8,
              Folder = 8,
              Class = 5,
              Color = 5,
              Module = 5,
              Keyword = 2,
              Constructor = 1,
              Interface = 1,
              Snippet = 0,
              Text = 1,
              TypeParameter = 1,
              Unit = 1,
              Value = 1,
            },
          },
          label_comparator,
        },
        formatting = {
          fields = { "abbr", "kind", "menu" }, -- order of columnsb,
          format = function(entry, item)
            item.menu = item.kind
            item = require("cmp-tailwind-colors").format(entry, item)
            if kind_icons[item.kind] then
              item.kind = kind_icons[item.kind] .. " "
            end
            return item
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        experimental = {
          -- ghost_text = {
          --   hl_group = "LspCodeLens",
          -- },
        },
      }
    end,
  },
  {
    "folke/neodev.nvim",
    ft = { "lua" },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp",
      "jose-elias-alvarez/typescript.nvim",
      -- "akinsho/flutter-tools.nvim",
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
        keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
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
        if client.name == "ts_ls" then
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

      for _, target_lsp in ipairs(lspList) do
        if target_lsp == "typescript" then
          require("typescript").setup {
            server = {
              capabilities = capabilities,
              on_attach = on_attach,
            },
          }
          goto continue
        end

        if target_lsp == "tailwindcss" then
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
          goto continue
        end

        if target_lsp == "emmet_ls" then
          lspconfig["emmet_ls"].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
          }
          goto continue
        end

        if target_lsp == "lua_ls" then
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
          goto continue
        end

        lspconfig[target_lsp].setup {
          capabilities = capabilities,
          on_attach = on_attach,
        }
        ::continue::
      end

      require("lspconfig.ui.windows").default_options.border = "rounded"
      vim.diagnostic.config {
        virtual_text = {
          prefix = "●",
        },
        update_in_insert = true,
        float = {
          border = "rounded",
          source = "always", -- Or "if_many"
        },
      }

      -- require("flutter-tools").setup {
      --   -- flutter_path = "/Users/jungai/.asdf/installs/flutter/3.3.2-stable",
      --   -- debugger = {
      --   -- 	enabled = true,
      --   -- 	run_via_dap = true,
      --   -- },
      --   outline = { auto_open = false },
      --   widget_guides = { enabled = true, debug = true },
      --   dev_log = { enabled = true, open_cmd = "30vnew", auto_open = true },
      --   lsp = {
      --     color = {
      --       enabled = true,
      --       background = true,
      --       virtual_text = false,
      --     },
      --     settings = {
      --       showTodos = true,
      --       renameFilesWithClasses = "prompt",
      --     },
      --     on_attach = on_attach,
      --     capabilities = capabilities,
      --   },
      --   settings = {
      --     enableSnippets = true,
      --   },
      -- }
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
        ensure_installed = lspList,

        -- auto-install configured servers (with lspconfig)
        automatic_installation = false, -- not the same as ensure_installed
      }

      local mason_tool_installer = require "mason-tool-installer"
      mason_tool_installer.setup {
        ensure_installed = {
          "prettier",
          "prettierd",
          "biome",
          -- "codespell",
          "stylua",
          "eslint_d",
          "nixpkgs-fmt",
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
        javascript = { { "biome", "eslint_d" } },
        javascriptreact = { { "biome", "eslint_d" } },
        typescript = { { "biome", "eslint_d" } },
        typescriptreact = { { "biome", "eslint_d" } },
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
          -- lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
          lsp_format = "fallback",
        }
      end,
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { { "prettierd", "biome", "prettier", "eslint_d" } },
        javascriptreact = { { "prettierd", "biome", "prettier", "eslint_d" } },
        typescript = { { "prettierd", "biome", "prettier", "eslint_d" } },
        typescriptreact = { { "prettierd", "biome", "prettier", "eslint_d" } },
        json = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        jsonc = { "prettierd" },
        markdown = { "prettierd" },
        ["markdown.mdx"] = { "prettierd" },
        svelte = { "prettierd" },
        astro = { "prettierd" },
        vue = { "prettierd" },
        nix = { "nixpkgs-fmt" },
        -- ["*"] = { "codespell" },
      },
    },
  },
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    opts = {
      definition = {
        edit = "<Cr>",
        quit = "q",
        close = "<Esc>",
      },
    },
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
}
