return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    config = function ()
      require("kanagawa").setup({
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      })
      vim.cmd("colorscheme kanagawa")
    end
  },
}
