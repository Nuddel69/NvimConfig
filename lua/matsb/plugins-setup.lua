-- Download packer.nvim automatically on any machine (for my lazy fingers)
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Automatically reloads neovim and packer when changes are made to this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- Yuno... kinda... yeh it's what's running this whole thing...

	-- Plugins go here...

	use("nvim-lua/plenary.nvim") -- Extended lua functionality
	use("bluz71/vim-nightfly-guicolors") -- Colourscheme to make it look noice
	use("christoomey/vim-tmux-navigator") -- Navigate splits
	use("szw/vim-maximizer") -- Maximise splits
	-- use("tpope/vim-surround") -- Encase snippets in various brackets
	-- use("vim-scripts/ReplaceWithRegister") -- Replace words with eachother
	use("nvim-lualine/lualine.nvim") -- Statusline
	-- use("numToStr/Comment.nvim") -- Easy commenting
	use("lewis6991/gitsigns.nvim") -- Basic git integration
	use({
		"folke/which-key.nvim",
		config = function()
			require("plugins.which-key").setup()
		end,
	}) -- Pop-up description of all keymaps

	-- File explorer
	use({ "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" } })

	-- Telescope (fuzzy finder)
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- Telescope (fuzzy finder)
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- Dependency

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	--------------------
	-- The Lazy Stuff --
	--------------------

	-- Auto-closing
	use("windwp/nvim-autopairs")
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

	-- Autocompletion
	use("hrsh7th/nvim-cmp") -- Autocomplete (since I'm lazy)
	use("hrsh7th/cmp-buffer") -- Suggest based on contents of current buffer
	use("hrsh7th/cmp-path") -- Suggest paths

	-- Snippets
	use("L3MON4D3/LuaSnip") -- Snippet engine
	use("saadparwaiz1/cmp_luasnip") -- Snippet source
	use("rafamadriz/friendly-snippets") -- Useful snippets

	-- Manage and install LSP servers, linters and formatters (make it look pretty)
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- Configure LSP
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use("onsails/lspkind.nvim")

	-- Formatting and Linting
	use("jose-elias-alvarez/null-ls.nvim") -- Linting
	use("jayp0521/mason-null-ls.nvim") -- Link mason with null-ls

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
