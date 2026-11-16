return {
  {
    "nvim-telescope/telescope.nvim",
    version = '*',
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    keys = {
      { "<leader>sf", function() require("telescope.builtin").find_files() end, desc = "[S]earch [F]iles" },
      { "<leader>se", function() require("telescope.builtin").find_files({ hidden = true }) end, desc = "[S]earch [E]verything" },
      { "<leader>sh", function() require("telescope.builtin").help_tags() end, desc = "[S]earch [H]elp" },
      { "<leader>sw", function() require("telescope.builtin").grep_string() end, desc = "[S]earch current [W]ord" },
      { "<leader>sg", function() require("telescope.builtin").live_grep() end, desc = "[S]earch by [G]rep" },
      { "<leader>ge", function()
          require("telescope.builtin").live_grep({
            additional_args = function() return { "--hidden" } end,
          })
        end, desc = "[G]rep [E]verything" },
      { "<leader>sd", function() require("telescope.builtin").diagnostics() end, desc = "[S]earch [D]iagnostics" },
      { "<leader>sr", function() require("telescope.builtin").resume() end, desc = "[S]earch [R]esume" },
      { "<leader>gf", function() require("telescope.builtin").git_files() end, desc = "Search [G]it [F]iles" },
      { "<leader>?", function() require("telescope.builtin").oldfiles() end, desc = "[?] Recent files" },
      { "<leader><space>", function() require("telescope.builtin").buffers() end, desc = "[ ] Buffers" },
      { "<leader>/", function()
          require("telescope.builtin").current_buffer_fuzzy_find(
            require("telescope.themes").get_dropdown({ winblend = 10, previewer = false })
          )
        end, desc = "[/] Fuzzy find in buffer" },
    },
  },
}
