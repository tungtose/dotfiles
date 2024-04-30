return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  name = "lsp_zero",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  config = function(client, bufnr)
    local lsp_zero = require('lsp-zero')

    require('lspconfig').tsserver.setup({})

    require('lspconfig').rust_analyzer.setup ({
      settings = {
        ['rust-analyzer'] = {
          diagnostics = {
            enable = true,
            experimental = {
              enable = true,
            },
            styleLints = {
              enable = true,
            }
          },
          cargo = {
            allFeatures = true,
          },
        },
      },
    })

    lsp_zero.on_attach(function(client, bufnr)
      lsp_zero.default_keymaps({ buffer = bufnr })
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

       nmap('<leader>cn', vim.lsp.buf.rename, '[R]e[n]ame')
       nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    end)

    lsp_zero.format_on_save({
      format_opts = {
        async = false,
        timeout_ms = 10000,
      },
      servers = {
        ['tsserver'] = { 'javascript', 'typescript', 'typescriptreact' },
        ["rust-analyzer"] = { "rust" },
      }
    })

    lsp_zero.set_sign_icons({
      error = '✘',
      warn = '▲',
      hint = '⚑',
      info = '»'
    })
  end
}
