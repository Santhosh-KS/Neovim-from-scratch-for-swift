-- :vnew
-- :echo nvim_get_current_buf()
-- : help autocommand

local group = vim.api.nvim_create_augroup("AnythingItCouldBe", { clear = true})
local attach_to_buffer = function (output_bufnr, pattern, command)
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = group,
    pattern = pattern,
    callback = function ()
      local append_data = function(_, data)
      if data then
        vim.api.nvim_buf_set_lines(output_bufnr, -1, -1, false, data)
      end
    end
    vim.api.nvim_buf_set_lines(output_bufnr, 0, 0, false, {"Dynamic Output of" .. tostring(vim.inspect(pattern))})
    vim.fn.jobstart(command, {
      stdout_buffered = true,
      on_stdout = append_data,
      on_stderr = append_data
    })
    vim.fn.jobstart({"node", "index.js"}, {
      stdout_buffered = true,
      on_stdout = append_data,
      on_stderr = append_data
    })
  end
  })
end


vim.api.nvim_create_user_command("CustomRun",
 function ()
    local bufnr = vim.fn.input "Bufnr: "
    local pattern = vim.fn.input "Pattern: "
    local command = vim.split(vim.fn.input "Command: ", " ")
    attach_to_buffer(tonumber(bufnr), pattern, command)
 end, {}
)

vim.api.nvim_create_user_command("Cbuf",
 function ()
   print(vim.api.nvim_get_current_buf())
 end, {}
)
