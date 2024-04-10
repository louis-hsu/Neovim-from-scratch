-- Combine the setting from ChrisAtMachine and Ben Frain
-- Louis 2022/0205

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Utility to call individual setup for each plugin
function get_setup(name)
  return string.format('require("setup/%s")', name)
end

-- Install basic plugins
return packer.startup(function(use)
  -- Basic plugins here (from ChrisAtMachine)
  use({ "wbthomason/packer.nvim" })     -- Have packer manage itself
  use({ "nvim-lua/popup.nvim" })        -- An implementation of the Popup API from vim in Neovim
  use({ "nvim-lua/plenary.nvim" })      -- Useful lua functions used ny lots of plugins

  -- Colorschemes and status line
  -- Customize shaunsingh/nord.nvim to match original vim setup
  -- Louis 2022/0206
  -- use({ "shaunsingh/nord.nvim",
  use({ "louis-hsu/nord.nvim",
    config = get_setup("nord"),
  })
  --   use({ "catppuccin/nvim" , as = "catppuccin",
  --   require("catppuccin").setup({
  --     flavor = "mocha",
  --  })
  --})
  
  -- Install todo-comments -- Louis 2023/1212
  use({ 
    "folke/todo-comments.nvim",
    require("todo-comments").setup()
  })

  -- Use vim-airline instead of lualine since not easy to configure -- Louis 2022/0205
  use({ "vim-airline/vim-airline-themes" })
  use({
    "vim-airline/vim-airline",
    config = get_setup("airline"),
    requires = { "vim-airline/vim-airline-themes", opt = true },
  })

  -- Git related
  use({ "tpope/vim-fugitive", config = get_setup("fugitive") })     -- Git integration
  use({ "mhinz/vim-signify", config = get_setup("signify") })       -- Git sign
  use({ "aymericbeaumet/vim-symlink" })                             -- Fix symlink issue
  --use({ "lewis6991/gitsigns.nvim", config = get_setup("gitsigns") })

  -- CMP plugins
  use({
    "hrsh7th/nvim-cmp",                     -- The completion plugin
    requires = {
      { "hrsh7th/cmp-buffer" },             -- buffer completions
      { "hrsh7th/cmp-path" },               -- path completions
      { "hrsh7th/cmp-cmdline" },            -- cmdline completions
      { "saadparwaiz1/cmp_luasnip" },       -- snippet completions
    },
    config = get_setup("cmp"),
  })

  -- Snippets
  use({ "L3MON4D3/LuaSnip" })                    --snippet engine
  use({ "rafamadriz/friendly-snippets" })        -- a bunch of snippets to use

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
