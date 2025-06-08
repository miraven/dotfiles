vim.cmd('highlight Visual guibg=LightSlateGrey')

vim.cmd('highlight TelescopeBorder guibg=none')
vim.cmd('highlight TelescopeTitle guibg=none')

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNrAbove", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNrBelow", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

vim.cmd[[colorscheme tokyonight]]
