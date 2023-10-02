local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "rebelot/kanagawa.nvim",
  "nvim-lualine/lualine.nvim",
  "nvim-treesitter/nvim-treesitter",
  "lewis6991/gitsigns.nvim",
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {}
  },
  {"williamboman/mason.nvim"},
  {"williamboman/mason-lspconfig.nvim"},
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    config = false,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {"hrsh7th/cmp-nvim-lsp"},
    }
  },
  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {"L3MON4D3/LuaSnip"}
    },
  },
  {
    "goolord/alpha-nvim",
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' }
    }
  },
  {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      opts = {} -- this is equalent to setup({}) function
  }
})
