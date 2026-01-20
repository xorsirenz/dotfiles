function SirenzColors(color)
	color = color or "rose-pine-moon"
	vim.cmd.colorscheme(color)

    vim.opt.colorcolumn = "80"
    vim.cmd 'highlight ColorColumn guibg=#0f1f2e'
    vim.cmd 'highlight Pmenu guibg=#0f1f2e'
    vim.cmd 'highlight PmenuSel guifg=#ebbcba guibg=#09121b'
    vim.cmd 'highlight LspInlayHint guibg=#0b1824'

end
return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
                highlight_groups = {
		            TelescopeBorder = { fg = "rose", bg = "#09121b" },
		            TelescopeNormal = { bg = "#09121b" },
		            TelescopePromptNormal = { bg = "#09121b" },
		            TelescopeResultsNormal = { fg = "subtle", bg = "#09121b" },
		            TelescopeSelection = { fg = "text", bg = "#09121b" },
		            TelescopeSelectionCaret = { fg = "rose", bg = "#09121b" },
	            },
            })
            vim.cmd("colorscheme rose-pine")
            SirenzColors()
        end
    },
}
