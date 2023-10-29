local status_ok, ls = pcall(require, "luasnip")
if not status_ok then
  return
end

local status_ok1, types = pcall(require, "luasnip.util.types")
if not status_ok1 then
  return
end


ls.config.set_config {
  -- This tells LuaSnip to remember to keeep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = true,
  -- This one is cool cause if you have dynamic sinippets, it updates as you type!
  updateevents = "TextChanged, TextChangedI",

  -- Autosnippets:
  enable_autosnippets = true,

  -- crazy highligths!
  -- #vid3
  -- ext_opts = nil,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = {{ "<-", "Error"}},
      },
    }
  },
}

local opts = { noremap = true, silet = true}
-- LuaSnips
-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
--
-- vim.keymap.set({'i', 's'}, '<c-k>',
--   function()
--     if ls.expand_or_jumpable() then
--       ls.expand_or_jump()
--     end
--   end
-- )
--
-- -- <c-j> is my jum packwards key
-- -- this will expand the current item or jump to the next item within the snippet.
-- vim.keymap.set({"i", "s"}, "<c-j>",
--   function()
--   if ls.jumpable(-1) then
--     ls.jump(-1)
--   end
-- end
-- )
--
-- -- <c-l> is my jum packwards key
-- -- this will expand the current item or jump to the next item within the snippet.
-- vim.keymap.set({"i", "s"}, "<c-l>",
--  function()
--   if ls.choice_active() then
--     ls.change_choice(1)
--   end
-- end
-- )
-- shortcut to source my luasnips file again, which will reload my sinippets
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/snippets/playground.lua<CR>")
-- vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/user/luasnippets/mySnips.lua<CR>")

-- vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})
--
-- vim.keymap.set({"i", "s"}, "<C-E>", function()
-- 	if ls.choice_active() then
-- 		ls.change_choice(1)
-- 	end
-- end, {silent = true})

require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/snippets"})
