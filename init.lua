require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.nerdtree"
require "user.neoterm"

require "user.cmp"
require "user.lsp"
require "user.treesitter"


require("mason").setup()
require("mason-lspconfig").setup()

require("lspconfig").sumneko_lua.setup {}
require("lspconfig").elixirls.setup {}
require("lspconfig").rust_analyzer.setup {}
