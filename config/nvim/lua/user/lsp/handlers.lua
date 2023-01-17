local builtin = require('telescope.builtin')
local capabilities = vim.lsp.protocol.make_client_capabilities()

return {
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities),

  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    local nmap = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end

      vim.keymap.set('n', keys, func, {
        silent = true,
        buffer = bufnr,
        desc = desc,
      })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', builtin.lsp_references, '[G]oto [R]eferences')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>ds', builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap(
      '<leader>ws',
      builtin.lsp_dynamic_workspace_symbols,
      '[W]orkspace [S]ymbols'
    )

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap(
      '<leader>wa',
      vim.lsp.buf.add_workspace_folder,
      '[W]orkspace [A]dd Folder'
    )
    nmap(
      '<leader>wr',
      vim.lsp.buf.remove_workspace_folder,
      '[W]orkspace [R]emove Folder'
    )
    nmap('<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
      vim.lsp.buf.format({
        bufnr = bufnr,
        filter = function(_)
          return client.name == 'null-ls'
        end,
      })
    end, {
      desc = 'Format current buffer with LSP',
    })
  end,

  setup = function()
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          return string.format('[%s] %s', diagnostic.source, diagnostic.message)
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
  end,
}
