return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require('nvim-treesitter.configs').setup {
		ensure_installed = { "bash", "c", "go", "lua", "python", "rust", "vim", "vimdoc", "query", "zig" },
  		sync_install = false,
  		auto_install = true,
  		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
			},
		}
	end
}
