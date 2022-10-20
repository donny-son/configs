vim.g.neon_style = "default"
vim.g.neon_italic_keyword = true
vim.g.neon_italic_function = true
vim.g.neon_transparent = true

vim.cmd [[colorscheme nightfly]]
vim.g.nightflyNormalFloat = true
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover, {
  border = "single"
}
)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signatureHelp, {
  border = "single"
}
)
vim.diagnostic.config({ float = { border = "single" } })
-- local winhighlight = {
--   winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel",
-- }
-- require('cmp').setup({
--   window = {
--     completion = cmp.config.window.bordered(winhighlight),
--     documentation = cmp.config.window.bordered(winhighlight),
--   }
-- })
vim.g.nightflyTransparent = true
