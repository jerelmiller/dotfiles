return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "SmiteshP/nvim-navic",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      local navic = require("nvim-navic")

      local function on_attach(client, bufnr)
        if client.server_capabilities.documentSymbolProvider then
          navic.attach(client, bufnr)
        end
      end

      local handlers = {
        ["textDocument/hover"] = vim.lsp.with(
          vim.lsp.handlers.hover,
          { border = "rounded" }
        ),
        ["textDocument/signatureHelp"] = vim.lsp.with(
          vim.lsp.handlers.signature_help,
          { border = "rounded" }
        ),
      }

      vim.lsp.config("*", {
        capabilities = vim.tbl_deep_extend("force", capabilities, {
          workspace = {
            fileOperations = {
              didRename = true,
              willRename = true,
            },
            didChangeWatchedFiles = {
              dynamicRegistration = true,
            },
          },
        }),
        on_attach = on_attach,
      })

      vim.lsp.config("eslint", {
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.code_action({
                context = {
                  diagnostics = { source = "eslint" },
                  only = { "source.fixAll" },
                },
                apply = true,
              })
            end,
          })
        end,
      })

      vim.lsp.config("tailwindcss", {
        settings = {
          tailwindCSS = {
            validate = true,
            classFunctions = { "cva", "cx", "clsx" },
          },
        },
      })

      vim.lsp.enable("cspell_ls")
      vim.lsp.config("cspell_ls", {
        filetypes = {
          "css",
          "gitcommit",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "mdx",
          "typescript",
          "typescriptreact",
          "yaml",
        },
      })

      vim.api.nvim_create_user_command("CSpellDisable", function()
        vim.lsp.enable("cspell_ls", false)
      end, {
        desc = "Disable CSpell",
      })

      vim.api.nvim_create_user_command("CSpellEnable", function()
        vim.lsp.enable("cspell_ls", true)
      end, {
        desc = "Enable CSpell",
      })

      vim.lsp.enable("lua")
      vim.lsp.config("lua", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            telemetry = {
              enable = false,
            },
          },
        },
        handlers = handlers,
      })

      require("mason").setup()
      require("mason-lspconfig").setup({
        automatic_enable = true,
        ensure_installed = {
          "astro",
          "bashls",
          "cspell_ls",
          "cssls",
          "cssmodules_ls",
          "dockerls",
          "elixirls",
          "eslint",
          "graphql",
          "html",
          "jsonls",
          "lua_ls",
          "marksman",
          "mdx_analyzer",
          "rust_analyzer",
          "stylelint_lsp",
          "tailwindcss",
          "taplo",
          "ts_ls",
          "yamlls",
        },
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({
              on_attach = on_attach,
              capabilities = capabilities,
              handlers = handlers,
            })
          end,
        },
      })

      local buf_request_all_orig = vim.lsp.buf_request_all

      -- HACK: If an the lsp returns empty contents instead of nil, return nil
      -- instead to prevent multiple sources from showing up (looking at you
      -- GraphQL)
      -- Source: https://github.com/neovim/neovim/pull/33692#issuecomment-2849182972
      --
      ---@param bufnr integer Buffer handle
      ---@param method vim.lsp.protocol.Method.ClientToServer.Request LSP method name
      ---@param params? table | (fun(client: vim.lsp.Client, bufnr: integer): table?) Parameters to send to the server.
      ---@param handler lsp.MultiHandler Result handler
      ---@diagnostic disable-next-line: duplicate-set-field
      function vim.lsp.buf_request_all(bufnr, method, params, handler)
        if method == vim.lsp.protocol.Methods.textDocument_hover then
          local handler_orig = handler
          ---@type lsp.MultiHandler
          function handler(results, context)
            for _, resp in pairs(results) do
              --- @type lsp.Hover?
              local result = resp.result
              if result ~= nil then
                local contents = result.contents
                if
                  type(contents) ~= "string" and #vim.tbl_keys(contents) == 0
                then
                  resp.result = nil
                end
              end
            end
            return handler_orig(results, context)
          end
        end

        return buf_request_all_orig(bufnr, method, params, handler)
      end
    end,
  },
}
