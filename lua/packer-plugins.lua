-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`

vim.cmd.packadd("packer.nvim")

return require("packer").startup(
    function(use)
        -- Packer can manage itself
        use "wbthomason/packer.nvim"
        use {"sbdchd/neoformat"}
        use {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.4",
            -- or                            , branch = '0.1.x',
            requires = {{"nvim-lua/plenary.nvim"}}
        }

        use {
            "nvim-treesitter/nvim-treesitter",
            run = function()
                local ts_update = require("nvim-treesitter.install").update({with_sync = true})
                ts_update()
            end
        }
        use "nvim-tree/nvim-tree.lua"
        use "gruvbox-community/gruvbox"
        use "pangloss/vim-javascript"

        use("mbbill/undotree")
        use {
            "VonHeikemen/lsp-zero.nvim",
            branch = "v1.x",
            requires = {
                -- LSP Support
                {"neovim/nvim-lspconfig"},
                {"williamboman/mason.nvim"},
                {"williamboman/mason-lspconfig.nvim"},
                -- Autocompletion
                {"hrsh7th/nvim-cmp"},
                {"hrsh7th/cmp-buffer"},
                {"hrsh7th/cmp-path"},
                {"saadparwaiz1/cmp_luasnip"},
                {"hrsh7th/cmp-nvim-lsp"},
                {"hrsh7th/cmp-nvim-lua"},
                -- Snippets
                {"L3MON4D3/LuaSnip"},
                {"rafamadriz/friendly-snippets"}
            }
        }
        use "lewis6991/gitsigns.nvim"
        use {
            "nvim-lualine/lualine.nvim",
            requires = {"nvim-tree/nvim-web-devicons", opt = true}
        }

        use {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v3.x",
            requires = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
                "MunifTanjim/nui.nvim"
            }
        }
    end
)
