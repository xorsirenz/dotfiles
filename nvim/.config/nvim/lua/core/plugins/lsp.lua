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
        local cmp = require("cmp")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        require("fidget").setup({})
        require("mason").setup()

        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "gopls",
                "jdtls",
                "pyright",
                "ts_ls",
            },
        })

        local servers = {
            "gopls",
            "jdtls",
            "pyright",
            "ts_ls",
        }

        for _, server in ipairs(servers) do
            vim.lsp.config(server, {
                capabilities = capabilities,
            })
        end

        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
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

        vim.lsp.config("zls", {
            capabilities = capabilities,
            settings = {
                zls = {
                    enable_inlay_hints = true,
                    enable_snippets = true,
                    warn_style = true,
                },
            },
        })

        vim.lsp.enable({
            "lua_ls",
            "gopls",
            "jdtls",
            "pyright",
            "ts_ls",
            "zls",
        })

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = "copilot", group_index = 2 },
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
            }, {
                { name = "buffer" },
            }),
        })

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

        vim.g.zig_fmt_parse_errors = 0
        vim.g.zig_fmt_autosave = 0
    end,
}
