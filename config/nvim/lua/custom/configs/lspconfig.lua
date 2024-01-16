local config = require "plugins.configs.lspconfig"
local lspconfig = require "lspconfig"
local on_attach = config.on_attach
local capabilities = config.capabilities

require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }
  end,
  ["tsserver"] = function()
    lspconfig.tsserver.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      init_options = {
        preferences = {
          disableSuggestions = true,
        },
      },
    }
  end,
  ["lua_ls"] = function()
    lspconfig.lua_ls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          telemetry = {
            enable = false,
          },
        },
      },
    }
  end,
  ["eslint"] = function()
    lspconfig.eslint.setup {
      capabilities = capabilities,
      on_attach = function(_, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
    }
  end,
}
