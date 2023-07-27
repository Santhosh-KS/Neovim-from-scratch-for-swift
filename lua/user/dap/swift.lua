local status_ok, swift = pcall(require, "daptest-nvim-swift")
if not status_ok then
	return
end

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>",opts)
keymap("n", "<Leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>",opts)
keymap( "n", "<Leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",opts)
keymap( "n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>",opts)
keymap( "n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>",opts)
keymap( "n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>",opts)

swift.setup({
  config = { bin_path = "~/swift_stuff/swift_versions/swift-5.8-RELEASE-ubuntu18.04/usr/bin/lldb"}
})
