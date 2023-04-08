vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- Theme
    use "rebelot/kanagawa.nvim"

    --Treesitter
    use( 'nvim-treesitter/nvim-treesitter', {run=':TSUpdate'})
    --Unto Tree
    use 'mbbill/undotree'
    --Lsp
    use { 'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {'williamboman/mason.nvim'},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},         -- Required
        {'hrsh7th/cmp-nvim-lsp'},     -- Required
        {'hrsh7th/cmp-buffer'},       -- Optional
        {'hrsh7th/cmp-path'},         -- Optional
        {'saadparwaiz1/cmp_luasnip'}, -- Optional
        {'hrsh7th/cmp-nvim-lua'},     -- Optional

        -- Snippets
        {'L3MON4D3/LuaSnip'},             -- Required
        {'rafamadriz/friendly-snippets'}, -- Optional
    }
}
--nvim tree and nvim web dev icons
use('nvim-tree/nvim-web-devicons')
--barbecue
use({
    "utilyre/barbecue.nvim",
    tag = "*",
    requires = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    after = "nvim-web-devicons", -- keep this if you're using NvChad
    config = function()
        require("barbecue").setup()
    end,    })
    --nvim surround
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })
    -- minimap
    use({'wfxr/minimap.vim'})
    use('nvim-tree/nvim-tree.lua')
    --barbar
    use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}
    --cellular automation animation
    use 'eandrju/cellular-automaton.nvim'
    --lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- autoclose brackets and quotes
    use 'jiangmiao/auto-pairs'
    --smooth scrolling
    use 'karb94/neoscroll.nvim'
    -- flutter Support
    use {
        'akinsho/flutter-tools.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
        -- terminal
        use {'s1n7ax/nvim-terminal',}
    }
    -- bracket pair guides
    use "lukas-reineke/indent-blankline.nvim"
    --leap. Jump to different parts of a file
    use 'ggandor/leap.nvim'
end)

