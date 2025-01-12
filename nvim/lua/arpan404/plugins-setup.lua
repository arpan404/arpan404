local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerCompile
  augroup end
]])
 
local status, packer = pcall(require, "packer")
if not status then
    return
end

return packer.startup(function(use)
  use("wbthomason/packer.nvim")

  use("bluz71/vim-nightfly-guicolors")

  use("christoomey/vim-tmux-navigator")

  use {
    'nvim-tree/nvim-tree.lua',
    requires = 'nvim-tree/nvim-web-devicons',
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },  -- lazy load on these commands
    config = function()
      require("nvim-tree").setup({})
    end
  }

  use("nvim-tree/nvim-web-devicons")
  
  -- Statusline
  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  })

  use({
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { 
      {'nvim-lua/plenary.nvim'},
      {'nvim-tree/nvim-web-devicons'}
    }
  })

  -- LSP Manager
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  -- LSP plugins
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require("lspsaga").setup({})
    end,
  })


  -- Autocompletion
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
