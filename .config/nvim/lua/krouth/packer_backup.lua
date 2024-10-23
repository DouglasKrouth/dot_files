-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]
---@diagnostic disable: undefined-global, lowercase-global

local fn = vim.fn

-- Automatically install Packer.
local installPath = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(installPath)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        installPath,
    }
    print 'Installing packer. Restart Neovim.'
    -- Only used if packer is installed in packer/opt/ instead of packer/start
    --vim.cmd 'packadd packer.nvim'
end

vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Only move on if we can require Packer.
--local ok, packer = pcall(require, 'packer')
--if not ok then
--    return
--end

packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float {border = 'rounded'}
        end,
    }
}

return require('packer').startup(function(use)
    -- Packer can manage itself
    use { "wbthomason/packer.nvim" }

    use ({
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    })
    -- use({
        --	'rose-pine/neovim',
        --	as = 'rose-pine',
        --	config = function()
            --		vim.cmd('colorscheme rose-pine')
            --	end})
            use({
                'ellisonleao/gruvbox.nvim',
                as = 'gruvbox',
                config = function()
                    vim.cmd('colorscheme gruvbox')
                end})
                use ( "ellisonleao/gruvbox.nvim" )
                use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
                use('nvim-treesitter/playground')
                use('theprimeagen/harpoon')
                use('mbbill/undotree')
                use('tpope/vim-fugitive')
                use 'mfussenegger/nvim-dap'
                use ('nvim-lua/plenary.nvim')
                use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})
                use {
                    'VonHeikemen/lsp-zero.nvim',
                    branch = 'v2.x',
                    requires = {
                        -- LSP Support
                        {'neovim/nvim-lspconfig'},             -- Required
                        {'williamboman/mason.nvim'},           -- Optional
                        {'williamboman/mason-lspconfig.nvim'}, -- Optional

                        -- Autocompletion
                        {'hrsh7th/nvim-cmp'},     -- Required
                        {'hrsh7th/cmp-nvim-lsp'}, -- Required
                        {'L3MON4D3/LuaSnip'},     -- Required
                    }
                }
                use {
                    'nvim-lualine/lualine.nvim',
                    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
                }
                if PACKER_BOOTSTRAP then
                    require('packer').sync()
                end
            end)
