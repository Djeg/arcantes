-- auto install packer if not installed
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
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- This is the list of plugins to install
return packer.startup(function(use)
  -- install packer
  use("wbthomason/packer.nvim") -- packer
  use("rebelot/kanagawa.nvim") -- kanagawa colorscheme
  use("patstockwell/vim-monokai-tasty") -- molokai colorscheme
  use("tomasr/molokai") -- an other molokai theme
  use("crusoexia/vim-monokai") -- other molokai theme
  use("folke/tokyonight.nvim") -- tokyo night theme

  -- project tree
  use("nvim-tree/nvim-tree.lua")
  use("nvim-tree/nvim-web-devicons")

  -- lualine
  use("nvim-lualine/lualine.nvim")

  -- git integration
  use("tpope/vim-fugitive")

  -- snippets
  use({ "L3MON4D3/LuaSnip", run = "make install_jsregexp" }) -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets")

  -- fuzzy finding w/ telescope
  use("nvim-lua/plenary.nvim")
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder
  use({
    "nvim-telescope/telescope-file-browser.nvim",
    require = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  })
  use("nvim-telescope/telescope-live-grep-args.nvim")

  -- automatically creates folders on file save
  use("jghauser/mkdir.nvim")

  -- treesitter for smart indentation rules
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "typescript", "tsx" },
        auto_install = true,
        indent = {
          enable = true,
        },
        highlight = {
          enable = true,
        },
      })
      local styled = require("djeg.plugins.tree-sitter.styled-injection")
      styled.queries()
      styled.directives()
    end,
  })

  -- autocomplete
  use({ "hrsh7th/nvim-cmp", lazy = true }) -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths

  -- auto pairs & closing
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({
        disable_filetype = { "TelescopePrompt", "vim" },
      })
    end,
  })

  -- managing & installing lsp servers, linters & formatters
  use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  use({ "neovim/nvim-lspconfig", lazy = true }) -- easily configure language servers
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      local saga = require("lspsaga")
      saga.setup({})
    end,
  }) -- enhanced lsp uis
  use("ray-x/lsp_signature.nvim") -- allow to display great signatures
  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

  -- formatting & linting
  -- use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

  -- editorconfig
  use("editorconfig/editorconfig-vim")

  -- styled components supports
  use("styled-components/vim-styled-components")

  -- rust setup
  use("simrat39/rust-tools.nvim")

  -- jest test in neovim o/
  use("David-Kunz/jester")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
