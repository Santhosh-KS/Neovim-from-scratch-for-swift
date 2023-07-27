return {
	settings = {

		-- Lua = {
		lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$PATH")] = true,
				},
			},
		},
	},
}
