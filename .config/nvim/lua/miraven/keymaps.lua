-- Basics
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex, { desc = "[E][x]plorer" })
vim.keymap.set("n", "<S-h>", "<cmd>bprev<cr>", { desc = "Previous buffer", silent = true })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer", silent = true })
vim.keymap.set("n", "<S-x>", "<cmd>bdelete<cr>", { desc = "Delete buffer", silent = true })
vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<cr>", { desc = "No highlight", silent = true })
-- nvimtree
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })
