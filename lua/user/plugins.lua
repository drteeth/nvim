local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here

  use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
  use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins

  use({ "moll/vim-bbye" })

  -- Colorschemes
  use({ "folke/tokyonight.nvim" })
  use("lunarvim/darkplus.nvim")

  -- cmp plugins
  use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
  use({ "hrsh7th/cmp-buffer" }) -- buffer completions
  use({ "hrsh7th/cmp-path" }) -- path completions
  -- use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-nvim-lua" })

  -- snippets
  -- use({ "L3MON4D3/LuaSnip" }) --snippet engine
  -- use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

  -- LSP
  -- use 'williamboman/nvim-lsp-installer' -- simple to use language server installer
  -- use 'williamboman/mason.nvim'
  -- use 'williamboman/mason-lspconfig.nvim'
  -- use 'neovim/nvim-lspconfig' -- enable LSP
  use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters

  -- TODO drop this in favour of mason an nvim-lspconfig
  use({ "mhanberg/elixir.nvim", requires = { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim" }})

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'
  use 'elixir-lang/tree-sitter-elixir'

  -- Ben
  use 'nanotech/jellybeans.vim'
  use 'lifepillar/vim-solarized8'
  use 'altercation/vim-colors-solarized'

  use 'janko-m/vim-test'

  use 'elixir-lang/vim-elixir'
  use 'tpope/vim-projectionist'
  use 'andyl/vim-projectionist-elixir'

  -- use 'scrooloose/nerdtree'
  use 'kyazdani42/nvim-tree.lua'
  use 'tpope/vim-fugitive'
  use 'gleam-lang/gleam.vim'

  use 'kassio/neoterm'

  use { 'junegunn/fzf', run = './install --all' }
  use 'junegunn/fzf.vim'
  vim.opt.grepprg = "rg --vimgrep --smart-case --follow"

  use 'tpope/vim-surround'
  use 'tomtom/tcomment_vim'
  use 'ekalinin/Dockerfile.vim'
  use 'airblade/vim-gitgutter'

  use 'luisiacc/gruvbox-baby'

  use {
    'olivercederborg/poimandres.nvim',
    config = function()
      require('poimandres').setup {
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
      }
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
