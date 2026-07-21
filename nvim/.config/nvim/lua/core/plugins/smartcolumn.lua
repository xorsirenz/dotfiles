return {
    'm4xshen/smartcolumn.nvim',
    config = function()
        require("smartcolumn").setup{
            colorcolumn = "80",
            disabled_filetypes = { "help", "text", "markdown" },
            custom_colorcolumn = {},
            scope = "file",
            editorconfig = true
        }
    end
}
