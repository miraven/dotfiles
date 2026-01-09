return {
    "NMAC427/guess-indent.nvim",
    -- NOTE: CONFIGURE COLORS HERE
    { import = 'colors.gruvbox' },
    { import = 'goodlooks' },
    {
        "folke/todo-comments.nvim",
        event = "VimEnter",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        opts = { signs = false }
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
    {
        "lewis6991/gitsigns.nvim",
        version = "*",
        lazy = false,
        config = function()
            require("gitsigns").setup {}
        end
    },
    {
        "tpope/vim-fugitive",
        version = "*",
        lazy = false,
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            -- disable netrw at the very start of your init.lua
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
            vim.g.nvim_tree_respect_buf_cwd = 1
            -- optionally enable 24-bit colour
            vim.opt.termguicolors = true
            -- empty setup using defaults
            require("nvim-tree").setup()
        end
    },
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            vim.opt.termguicolors = true
            require("bufferline").setup {
                options = {
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "File Explorer",
                            text_align = "left",
                            separator = true
                        }
                    },
                    indicator = {
                        icon = '',
                        style = 'none',
                    },
                    separator_style = { '', '' },
                },
                highlights = {
                    background = { bg = 'none' },
                    fill = { bg = 'none' },
                    buffer_selected = { bg = 'none', fg = '#fab387' },
                    buffer_visible = { bg = 'none', fg = '#a6adc8' },
                    close_button = { bg = 'none' },
                    close_button_selected = { bg = 'none' },
                    close_button_visible = { bg = 'none' },
                    duplicate = { bg = 'none' },
                    duplicate_selected = { bg = 'none' },
                    duplicate_visible = { bg = 'none' },
                    error = { bg = 'none' },
                    error_selected = { bg = 'none' },
                    error_visible = { bg = 'none' },
                    hint = { bg = 'none' },
                    hint_selected = { bg = 'none' },
                    hint_visible = { bg = 'none' },
                    indicator_selected = { bg = 'none' },
                    indicator_visible = { bg = 'none' },
                    info = { bg = 'none' },
                    info_selected = { bg = 'none' },
                    info_visible = { bg = 'none' },
                    modified = { bg = 'none' },
                    modified_selected = { bg = 'none' },
                    modified_visible = { bg = 'none' },
                    numbers = { bg = 'none' },
                    numbers_selected = { bg = 'none' },
                    numbers_visible = { bg = 'none' },
                    offset_separator = { bg = 'none' },
                    pick = { bg = 'none' },
                    pick_selected = { bg = 'none' },
                    pick_visible = { bg = 'none' },
                    separator = { bg = 'none' },
                    separator_selected = { bg = 'none' },
                    separator_visible = { bg = 'none' },
                    tab = { bg = 'none' },
                    tab_close = { bg = 'none' },
                    tab_selected = { bg = 'none' },
                    tab_separator = { bg = 'none' },
                    tab_separator_selected = { bg = 'none' },
                    trunc_marker = { bg = 'none' },
                    warning = { bg = 'none' },
                    warning_selected = { bg = 'none' },
                    warning_visible = { bg = 'none' },
                },
            }
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "bash", "diff", "html", "c", "cpp", "python", "rust", "go", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
                auto_install = true,
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("treesitter-context").setup()
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.3",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        'saghen/blink.cmp',
        -- optional: provides snippets for the snippet source
        dependencies = { 'rafamadriz/friendly-snippets' },

        -- use a release tag to download pre-built binaries
        version = '1.*',
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = 'cargo build --release',
        -- If you use nix, you can build from source using latest nightly rust with:
        -- build = 'nix run .#build-plugin',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = { preset = 'super-tab' },

            appearance = {
                -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = 'mono'
            },

            -- (Default) Only show the documentation popup when manually triggered
            completion = { documentation = { auto_show = true } },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
            -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
            -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
            --
            -- See the fuzzy documentation for more information
            fuzzy = { implementation = "lua" }
        },
        opts_extend = { "sources.default" }
    },
    {
        -- Main LSP Configuration
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs and related tools to stdpath for Neovim
            -- Mason must be loaded before its dependents so we need to set it up here.
            -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
            { 'mason-org/mason.nvim', opts = {} },
            'mason-org/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',

            -- Useful status updates for LSP.
            { 'j-hui/fidget.nvim',    opts = {} },

            -- Allows extra capabilities provided by blink.cmp
            'saghen/blink.cmp',
        },
        config = function()
            -- servers
            vim.lsp.config("*", {})
            vim.lsp.enable({
                "pyright",
                "clangd",
                "gopls",
                "lua_ls",
                "ts_ls",
                "rust_analyzer"
            })

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    -- keymaps
                    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
                        { buffer = args.buf, desc = "GoTo Definition" })
                    vim.keymap.set("n", "gr", require('telescope.builtin').lsp_references,
                        { buffer = args.buf, desc = "GoTo References" })
                    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
                        { buffer = args.buf, desc = "View Diagnostic" })
                    vim.keymap.set('n', '<leader>td',
                        function()
                            local new_config = not vim.diagnostic.config().virtual_text
                            vim.diagnostic.config({ virtual_text = new_config })
                        end, { desc = 'Toggle diagnostic virtual_text' })

                    local client = vim.lsp.get_client_by_id(args.data.client_id)

                    -- autocompletion
                    -- if client:supports_method('textDocument/completion') then
                    --     vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
                    -- end

                    -- go to implementation
                    if client:supports_method('textDocument/implementation') then
                        vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end,
                            { buffer = args.buf, desc = "GoTo Implementation" })
                    end

                    -- Auto-format ("lint") on save.
                    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
                    if not client:supports_method('textDocument/willSaveWaitUntil') and client:supports_method('textDocument/formatting') then
                        vim.api.nvim_create_autocmd('BufWritePre', {
                            group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
                            buffer = args.buf,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                            end,
                        })
                    end
                end,
            })


            -- diagnostics
            vim.diagnostic.config({ virtual_text = true })
        end
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    },
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        dependencies = { { "nvim-mini/mini.icons", opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
    }
}
