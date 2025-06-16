-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	{
		"gruvbox-community/gruvbox",
		"catppuccin/nvim",
		"sbdchd/neoformat",
		{
			"nvim-telescope/telescope.nvim",
			version = "0.1.4",
			-- or version = "0.1.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
		},
		{
			"VonHeikemen/lsp-zero.nvim",
			branch = "v1.x",
			dependencies = {
				-- LSP Support
				"neovim/nvim-lspconfig",
				"williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",
				-- Autocompletion
				"hrsh7th/nvim-cmp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-nvim-lua",
				-- Snippets
				"L3MON4D3/LuaSnip",
				"rafamadriz/friendly-snippets",
			},
		},
		"lewis6991/gitsigns.nvim",
		{
			"nvim-lualine/lualine.nvim",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
				config = function()
					require("lualine").setup({
						options = {
							icons_enabled = true,
						},
					})
				end,
			},
		},
	},
})
