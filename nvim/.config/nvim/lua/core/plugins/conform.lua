return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "autopep8" },
            go = { "gofmt" },
            javascript = { "prettier" },
            javascriptreact = { "prettier" },
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
            java = { "google-java-format" },
            zig = { "zigfmt" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    },
}
