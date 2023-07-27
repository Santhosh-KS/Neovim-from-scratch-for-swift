local status_ok, lspcfg = pcall(require, "lspconfig")
if not status_ok then
  return
end

lspcfg.clangd.setup {}
