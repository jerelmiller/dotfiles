local cmp = require('cmp')
-- local luasnip = require('luasnip')
local cmp_ultisnips_mappings = require('cmp_nvim_ultisnips.mappings')

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
    and vim.api
        .nvim_buf_get_lines(0, line - 1, line, true)[1]
        :sub(col, col)
        :match('%s')
      == nil
end

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
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = {
    { name = 'ultisnips' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  },
})
