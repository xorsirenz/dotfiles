return {
    "neovim/nvim-lspconfig",

    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        local capabilities =
            require("cmp_nvim_lsp").default_capabilities()

        vim.filetype.add({
            extension = {
                gotmpl = "gotmpl",
            },
        })

        require("fidget").setup({})
        require("mason").setup()

        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "gopls",
                "jdtls",
                "basedpyright",
                "ruff",
                "ts_ls",
                "jsonls",
                "bashls",
                "yamlls",
                "html",
                "cssls",
                "marksman",
                "taplo",
                "sqls",
            },
        })

        -- LSP capabilities
        vim.lsp.config("*", {
            capabilities = capabilities,
        })

        -- Lua
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    format = {
                        enable = true,
                        defaultConfig = {
                            indent_style = "space",
                            indent_size = "2",
                        },
                    },
                },
            },
        })

        -- Zig
        vim.lsp.config("zls", {
            settings = {
                zls = {
                    enable_inlay_hints = true,
                    enable_snippets = true,
                    warn_style = true,
                },
            },
        })

        -- Enable LSP servers
        vim.lsp.enable({
            "lua_ls",
            "gopls",
            "jdtls",
            "basedpyright",
            "ruff",
            "ts_ls",
            "jsonls",
            "bashls",
            "yamlls",
            "html",
            "cssls",
            "marksman",
            "taplo",
            "sqls",
            "zls",
        })

        -- Diagnostics
        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })

        -- Zig formatting
        vim.g.zig_fmt_parse_errors = 0
        vim.g.zig_fmt_autosave = 0
    end,
}
