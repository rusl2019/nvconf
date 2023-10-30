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
            return require("packer.util").float({
                border = "rounded",
            })
        end,
    },
})

-- Install your plugins here
return packer.startup(function(use)
    use("wbthomason/packer.nvim")
    use({
        "nvim-tree/nvim-tree.lua",
        tag = "compat-nvim-0.7",
        requires = {
            "nvim-tree/nvim-web-devicons",
        },
    })
    use({
        "akinsho/toggleterm.nvim",
        tag = "v2.*",
    })
    use({
        "p00f/nvim-ts-rainbow",
        after = "nvim-treesitter",
    })
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({
                with_sync = true,
            })
        end,
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "c",
                    "cpp",
                    "lua",
                    "bash",
                    "python",
                    "fortran",
                    "fish",
                    "latex",
                },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                rainbow = {
                    enable = true,
                    disable = { "html" },
                    extended_mode = false,
                    max_file_lines = nil,
                },
            })
        end,
    })
    use("neovim/nvim-lspconfig")
    use({
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    })
    use({
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
    })
    use({
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
    })
    use({
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    })
    use("stevearc/aerial.nvim")
    use({
        "numToStr/Comment.nvim",
        module = { "Comment", "Comment.api" },
        keys = { "gc", "gb" },
        config = function()
            require("Comment").setup()
        end,
    })
    use("onsails/lspkind.nvim")
    use({
        "catppuccin/nvim",
        as = "catppuccin",
    })
	use("rebelot/kanagawa.nvim")
    use({
        "akinsho/bufferline.nvim",
        tag = "v3.*",
        requires = "nvim-tree/nvim-web-devicons",
    })
    use({
        "nvim-lualine/lualine.nvim",
        requires = {
            "kyazdani42/nvim-web-devicons",
            opt = true,
        },
    })
    use("lukas-reineke/indent-blankline.nvim")
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

-- init.lua
