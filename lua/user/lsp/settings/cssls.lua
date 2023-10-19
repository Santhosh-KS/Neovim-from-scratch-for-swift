local status_ok, lspcfg = pcall(require, "lspconfig")
if not status_ok then
  return
end

lspcfg.ccls.setup {
 --  cmd = {
 --    "rustup", "run", "stable", "rust-analyzer"
 --  },
	-- on_attach = require("user.lsp.handlers").on_attach,
	-- capabilities = require("user.lsp.handlers").capabilities,

  default_config = util.utf8_config {
    cmd = {"ccls"};
    filetypes = {"c", "cpp", "objc", "objcpp"};
    root_dir = util.root_pattern("compile_commands.json", "compile_flags.txt", ".git");
  };

    default_config = {
      root_dir = [[root_pattern("compile_commands.json", "compile_flags.txt", ".git")]];
      on_init = [[function to handle changing offsetEncoding]];
      capabilities = [[default capabilities, with offsetEncoding utf-8]];
    };
}

-- local configs = require 'nvim_lsp/configs'
-- local util = require 'nvim_lsp/util'
--
-- configs.ccls = {
--   default_config = util.utf8_config {
--     cmd = {"ccls"};
--     filetypes = {"c", "cpp", "objc", "objcpp"};
--     root_dir = util.root_pattern("compile_commands.json", "compile_flags.txt", ".git");
--   };
--   -- commands = {};
--   -- on_new_config = function(new_config) end;
--   -- on_attach = function(client, bufnr) end;
--   docs = {
--     vscode = "ccls-project.ccls";
--     description = [[
-- https://github.com/MaskRay/ccls/wiki
--
-- ccls relies on a [JSON compilation database](https://clang.llvm.org/docs/JSONCompilationDatabase.html) specified
-- as compile_commands.json or, for simpler projects, a compile_flags.txt.
-- ]];
--     default_config = {
--       root_dir = [[root_pattern("compile_commands.json", "compile_flags.txt", ".git")]];
--       on_init = [[function to handle changing offsetEncoding]];
--       capabilities = [[default capabilities, with offsetEncoding utf-8]];
--     };
--   };
-- }
-- -- vim:et ts=2 sw=2
