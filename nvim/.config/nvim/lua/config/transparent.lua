vim.cmd('highlight TelescopeBorder guibg=none')
vim.cmd('highlight TelescopeTitle guibg=none')

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- lines
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNrAbove", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNrBelow", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

-- git signs
vim.api.nvim_set_hl(0, "GitGutterAdd", { bg = "none" })
vim.api.nvim_set_hl(0, "GitGutterDelete", { bg = "none" })
vim.api.nvim_set_hl(0, "GitGutterChangeDelete", { bg = "none" })
vim.api.nvim_set_hl(0, "GitSignsChange", { bg = "none" })
vim.api.nvim_set_hl(0, "GitSignsDelete", { bg = "none" })
vim.api.nvim_set_hl(0, "GitSignsAdd", { bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticError", { bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticSignError", { bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticSignHint", { bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { bg = "NONE" })
