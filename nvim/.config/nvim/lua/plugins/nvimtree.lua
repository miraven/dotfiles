return {
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
    opts = {},
    keys = {
      { "<C-n>", "<cmd>NvimTreeFindFileToggle<cr>", desc = "nvimtree toggle" },
    },
  },
}
