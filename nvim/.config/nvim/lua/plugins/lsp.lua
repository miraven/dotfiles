return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "mason-org/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      { "j-hui/fidget.nvim", opts = {} },
      "saghen/blink.cmp",
    },
    config = function()
      vim.lsp.enable({
        "pyright",
        "clangd",
        "gopls",
        "lua_ls",
        "ts_ls",
        "rust_analyzer",
      })

      vim.diagnostic.config({ virtual_text = true })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = args.buf, desc = "GoTo Definition" })
          vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { buffer = args.buf, desc = "References" })
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = args.buf, desc = "GoTo Implementation" })
          vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { buffer = args.buf, desc = "View Diagnostic" })
          vim.keymap.set("n", "<leader>td", function()
            local new = not vim.diagnostic.config().virtual_text
            vim.diagnostic.config({ virtual_text = new })
          end, { desc = "Toggle virtual text" })

          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client:supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
              end,
            })
          end
        end,
      })
    end,
  },
}
