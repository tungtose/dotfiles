local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = 'rounded'}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = 'rounded'}),
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.colorProvider = { dynamicRegistration = false }


lspconfig.gopls.setup {
  cmd = {"gopls", "serve"},
  filetypes = {"go", "gomod"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}


-- function OrgImports(wait_ms)
--   local params = vim.lsp.util.make_range_params()
--   params.context = {only = {"source.organizeImports"}}
--   local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
--   for _, res in pairs(result or {}) do
--     for _, r in pairs(res.result or {}) do
--       if r.edit then
--         vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
--       else
--         vim.lsp.buf.execute_command(r.command)
--       end
--     end
--   end
-- end

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = { "*.go" },
--   callback = function()
-- 	  vim.lsp.buf.formatting_sync(nil, 3000)
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = { "*.go" },
-- 	callback = function()
-- 		local params = vim.lsp.util.make_range_params(nil, vim.lsp.util._get_offset_encoding())
-- 		params.context = {only = {"source.organizeImports"}}
--
-- 		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
-- 		for _, res in pairs(result or {}) do
-- 			for _, r in pairs(res.result or {}) do
-- 				if r.edit then
-- 					vim.lsp.util.apply_workspace_edit(r.edit, vim.lsp.util._get_offset_encoding())
-- 				else
-- 					vim.lsp.buf.execute_command(r.command)
-- 				end
-- 			end
-- 		end
-- 	end,
-- })
