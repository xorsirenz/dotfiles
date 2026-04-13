return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
        require('nvim-treesitter').setup {
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            init = function()
                local ensureInstalled = {
                    "bash", "c", "go", "lua", "python", "rust", "vim", "vimdoc", "query", "zig"
                }
                local alreadyInstalled = require('nvim-treesitter.config').get_installed()
                local parsersToInstall = vim.iter(ensureInstalled)
                    :filter(function(parser)
                        return not vim.tbl_contains(alreadyInstalled, parser)
                    end)
                    :totable()
                require('nvim-treesitter').install(parsersToInstall)
            end,
        }
    end
}
