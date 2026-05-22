-- lua/imperialops/lazy.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Core Utilities
    { 'nvim-lua/plenary.nvim' },
    { 'tpope/vim-fugitive' },
    { 'preservim/nerdcommenter' },
    { 'mbbill/undotree' },
    { 'theprimeagen/harpoon' },
    { 'neovim/nvim-lspconfig' },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        version = '*',
        dependencies = { 
          'nvim-lua/plenary.nvim',
          { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        }
    },

    -- Color Scheme
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    },

    -- Trouble
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup { icons = false }
        end
    },

    -- Completion Engine
    { 'hrsh7th/nvim-cmp' },

    -- ToggleTerm
    {
        "akinsho/toggleterm.nvim",
        version = '*',
        config = function()
            require("toggleterm").setup()
        end
    },

    -- Treesitter (CRITICAL: Do not lazy-load)
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate"
    },
    { "nvim-treesitter/nvim-treesitter-context" },

    -- UI/Zen
    { "folke/zen-mode.nvim" }
})
