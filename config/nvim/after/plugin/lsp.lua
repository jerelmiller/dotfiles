local lsp = require('lsp-zero').preset({name = 'recommended'})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup_servers({
  'cssls',
  'cssmodules_ls',
  'elixirls',
  'eslint',
  'html',
  'graphql',
  'lua_ls',
  'tailwindcss',
  'tsserver',
})

lsp.configure('tsserver', {
  settings = {
    typescript = {
      format = {
        enabled = false
      }
    }
  }
})

lsp.configure('lua_ls', {
  settings = {
    Lua = {
      workspace = {
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local cmp = require('cmp')
local cmp_ultisnips_mappings = require('cmp_nvim_ultisnips.mappings')

local cmp_kinds = {
  Text = '  ',
  Method = '  ',
  Function = '  ',
  Constructor = '  ',
  Field = '  ',
  Variable = '  ',
  Class = '  ',
  Interface = '  ',
  Module = '  ',
  Property = '  ',
  Unit = '  ',
  Value = '  ',
  Enum = '  ',
  Keyword = '  ',
  Snippet = '  ',
  Color = '  ',
  File = '  ',
  Reference = '  ',
  Folder = '  ',
  EnumMember = '  ',
  Constant = '  ',
  Struct = '  ',
  Event = '  ',
  Operator = '  ',
  TypeParameter = '  ',
}

vim.cmd([[
  highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#4C566A
  highlight! link CmpItemAbbrMatch Statement

  highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch

  highlight! link CmpItemKindVariable Variable
  highlight! link CmpItemKindInterface CmpItemKindVariable
  highlight! link CmpItemKindText CmpItemKindVariable
 
  highlight! link CmpItemKindFunction Function
  highlight! link CmpItemKindMethod CmpItemKindFunction
 
  highlight! link CmpItemKindKeyword Keyword
  highlight! link CmpItemKindProperty CmpItemKindKeyword
  highlight! link CmpItemKindUnit CmpItemKindKeyword

  highlight! link CmpItemKindClass SpecialChar
]])

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn['UltiSnips#Anon'](args.body)
    end,
  },
  formatting = {
    format = function(_, vim_item)
      vim_item.kind = (cmp_kinds[vim_item.kind] or '') .. vim_item.kind
      return vim_item
    end,
  },
  mapping = {
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    ['<Tab>'] = cmp.mapping(function(fallback)
      cmp_ultisnips_mappings.compose({
        'select_next_item',
        'jump_forwards',
        'expand',
      })(fallback)

      -- if cmp.visible() then
      --   cmp.select_next_item()
      -- elseif luasnip.expand_or_jumpable() then
      --   luasnip.expand_or_jump()
      -- elseif has_words_before() then
      --   cmp.complete()
      -- else
      --   fallback()
      -- end
    end, {
      'i',
      's',
    }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      cmp_ultisnips_mappings.compose({
        'select_prev_item',
        'jump_backwards',
      })(fallback)
      -- if cmp.visible() then
      --   cmp.select_prev_item()
      -- elseif luasnip.jumpable(-1) then
      --   luasnip.jump(-1)
      -- else
      --   fallback()
      -- end
    end, {
      'i',
      's',
    }),
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})
