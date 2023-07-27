local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
    formatting.swift_format.with({extra_args = { "format", "--in-place", "--recursive", "--parallel", "--color-diagnostics"}}),
    -- formatting.swiftlint.with({extra_args ="--recursive", "--parallel" }),
    formatting.stylua,
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
    -- diagnostics.flake8
    diagnostics.swiftlint,
	},
  autostart=true
})
