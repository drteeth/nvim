local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  print("Failed to require lspconfig")
  return
end

require "user.lsp.configs"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
