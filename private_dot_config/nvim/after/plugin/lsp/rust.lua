local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = 'rounded'}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = 'rounded'}),
}

-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.colorProvider = { dynamicRegistration = false }

require'lspconfig'.rust_analyzer.setup {
  handlers = handlers,
  capabilities =capabilities,
  checkOnSave = {
    command = "clippy"
  }
}

local opts = {
  tools = {
    autoSetHints = true,
    -- hover_with_actions = true,
    runnable = {
      use_telescope = true
    },
    inlay_hints = {
      -- Only show inlay hints for the current line
      only_current_line = false,
      -- Event which triggers a refersh of the inlay hints.
      -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
      -- not that this may cause  higher CPU usage.
      -- This option is only respected when only_current_line and
      -- autoSetHints both are true.
      only_current_line_autocmd = "CursorHold",

      -- wheter to show parameter hints with the inlay hints or not
      show_parameter_hints = true,

      -- whether to show variable name before type hints with the inlay hints or not
      show_variable_name = false,

      -- prefix for parameter hints
      parameter_hints_prefix = "<- ",

      -- prefix for all the other hints (type, chaining)
      other_hints_prefix = "=> ",

      -- whether to align to the length of the longest line in the file
      max_len_align = false,

      -- padding from the left if max_len_align is true
      max_len_align_padding = 1,

      -- whether to align to the extreme right or not
      right_align = false,

      -- padding from the right if right_align is true
      right_align_padding = 7,

      -- The color of the hints
      highlight = "Comment",
    },
  },

  server = {
    on_attach = function(_, bufnr)
     -- Hover actions
     vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
     -- Code action groups
     vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end, 
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy"
        }
      }
    }
  }
}

require('rust-tools').setup(opts)
