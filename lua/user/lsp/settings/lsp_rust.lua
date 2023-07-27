local status_ok, lspcfg = pcall(require, "lspconfig")
if not status_ok then
  return
end

lspcfg.rust_analyzer.setup {
  cmd = {
    "rustup", "run", "stable", "rust-analyzer"
  },
	on_attach = require("user.lsp.handlers").on_attach,
	capabilities = require("user.lsp.handlers").capabilities,
}
