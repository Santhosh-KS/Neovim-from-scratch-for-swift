
local status_ok, _ = pcall(require, "nvim-dap")
if not status_ok then
  return
end

-- require "user.dap.swift".setup(
--   { bin_path = "~/swift_stuff/swift_versions/swift-5.8-RELEASE-ubuntu18.04/usr/bin/lldb"}
-- )
require "user.dap.swift"
require "user.dap.cpp"
