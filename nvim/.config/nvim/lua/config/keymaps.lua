-- Basics
vim.keymap.set("n", "<leader>ex", "<cmd>Oil<cr>", { desc = "Oil file explorer" })
vim.keymap.set("n", "<S-h>", "<cmd>bprev<cr>", { desc = "Previous buffer", silent = true })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer", silent = true })
vim.keymap.set("n", "<S-x>", "<cmd>bdelete<cr>", { desc = "Delete buffer", silent = true })
vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<cr>", { desc = "No highlight", silent = true })

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
