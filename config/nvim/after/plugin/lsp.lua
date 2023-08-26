local cmp = require('cmp')
local cmp_ultisnips_mappings = require('cmp_nvim_ultisnips.mappings')
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })

  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
end)

lsp.setup_servers({
  'cssls',
  'cssmodules_ls',
  'elixirls',
  'eslint',
  'graphql',
  'html',
  'lua_ls',
  'jsonls',
  'tailwindcss',
  'tsserver',
  'yamlls'
})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

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
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Tab>'] = cmp.mapping(function(fallback)
      cmp_ultisnips_mappings.compose({
        'select_next_item',
        'jump_forwards',
        'expand',
      })(fallback)
    end, {
      'i',
      's',
    }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      cmp_ultisnips_mappings.compose({
        'select_prev_item',
        'jump_backwards',
      })(fallback)
    end, {
      'i',
      's',
    }),
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'ultisnips' },
    { name = 'path' }
  }, {
    { name = 'buffer' }
  })
})

vim.diagnostic.config({
  virtual_text = {
    format = function(diagnostic)
      return string.format(
        '[%s] %s (%s)',
        diagnostic.source,
        diagnostic.message,
        diagnostic.code
      )
    end,
  },
  float = {
    format = function(diagnostic)
      return string.format('[%s] %s', diagnostic.source, diagnostic.message)
    end,
    border = 'rounded',
  },
})

vim.lsp.handlers['textDocument/hover'] =
  vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })

vim.lsp.handlers['textDocument/signatureHelp'] =
  vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

require('lspconfig.ui.windows').default_options = {
  border = 'rounded',
}
