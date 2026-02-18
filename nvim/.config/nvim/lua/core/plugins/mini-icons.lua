return {
    'nvim-mini/mini.nvim',
    version = false,
    config = function()
        require('mini.icons').setup {
            style = 'glyph',

            default   = {},
            directory = {},
            extension = {},
            file      = {},
            filetype  = {},
            lsp       = {},
            os        = {},

            use_file_extension = function(ext, file) return true end,
        }
    end
}
