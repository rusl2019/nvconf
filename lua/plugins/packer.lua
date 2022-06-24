local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
		return require("packer.util").float { border = "rounded" }
		end,
	},
}

-- Install your plugins here
return packer.startup(function(use)
	-- Packer manager itself
	use 'wbthomason/packer.nvim'

	-- Basic Plugins
	-- -- Easily comment stuff
	use 'numToStr/Comment.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
		tag = 'nightly'
	}
	use {
		'akinsho/bufferline.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		tag = "v2.*"
	}
	use 'lukas-reineke/indent-blankline.nvim'
	use {
		'akinsho/toggleterm.nvim',
		tag = 'v1.*'
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons',
			opt = true
		}
	}
	use 'lewis6991/impatient.nvim'

	-- Treesitter Syntax Higlighting
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- LSP
	use {
		"williamboman/nvim-lsp-installer",
		"neovim/nvim-lspconfig"
	}
	-- nvim-cmp and luasnip
	use {
		'hrsh7th/nvim-cmp', -- Autocompletion plugin
		'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
		'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
		'L3MON4D3/LuaSnip' -- Snippets plugin
	}

	-- colorscheme
	use 'folke/tokyonight.nvim'

	-- Telescope
	-- use "nvim-telescope/telescope.nvim"


	-- Git
	-- use "lewis6991/gitsigns.nvim"

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
