if !exists('g:loaded_cmp') | finish | endif

set completeopt=menuone,noinsert,noselect

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

lua <<EOF
  local cmp = require'cmp'
  local lspkind = require'lspkind'

  local source_mapping = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    cmp_tabnine = "[TN]",
    path = "[Path]",
  }

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true
      }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
    }, {
      { name = 'buffer' },
    }, {
      { name = 'cmp_tabnine' },
    }),
    formatting = {
      format = lspkind.cmp_format({
        with_text = false,
        maxwidth = 50,

        before = function(entry, vim_item)
         vim_item.kind = lspkind.presets.default[vim_item.kind]
         local menu = source_mapping[entry.source.name]
         if entry.source.name == 'cmp_tabnine' then
           if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
             menu = entry.completion_item.data.detail .. ' ' .. menu
           end
           vim_item.kind = ''
         end
         vim_item.menu = menu 
         return vim_item
        end
     })
    }
  })

  vim.cmd [[highlight! default link CmpItemKind CmpItemMenuDefault]]
EOF

