local N = {}

function N.setup()
    vim.cmd [[packadd packer.nvim]]

    local packerStatus, packer = pcall(require, 'packer')
    if (not packerStatus) then
        return
    end

    return packer.startup(function(use)
        use 'wbthomason/packer.nvim'

        use 'tjdevries/colorbuddy.nvim'
        use { 'shaunsingh/solarized.nvim', config = require('config.colorscheme').setup }

        use 'nvim-lua/plenary.nvim'
        use 'nvim-tree/nvim-web-devicons'
        use { 'nvim-telescope/telescope.nvim', tag = '0.1.1' }
        use 'nvim-telescope/telescope-file-browser.nvim'
        use 'williamboman/mason.nvim'
        use 'williamboman/mason-lspconfig.nvim'
        use 'neovim/nvim-lspconfig'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/nvim-cmp'
        use 'hrsh7th/cmp-vsnip'
        use 'hrsh7th/vim-vsnip'
        use 'onsails/lspkind.nvim'
        use 'nvim-tree/nvim-tree.lua'
        use 'nvim-treesitter/nvim-treesitter'
        use 'nvim-lualine/lualine.nvim'
        use 'jose-elias-alvarez/null-ls.nvim'
        use 'lewis6991/gitsigns.nvim'
        use { 'j-hui/fidget.nvim', tag = 'legacy', config = require("config.fidget").setup }
    end)
end

return N
