local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.mason"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
require "user.lsp.settings.clangd"
require "user.lsp.settings.jsonls"
-- require "user.lsp.settings.html"
-- require "user.lsp.settings.cssls"
require "user.lsp.settings.sourcekit_lsp_swift"
-- require "user.lsp.settings.lsp_rust"
