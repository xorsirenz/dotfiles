return {
    "nvim-telescope/telescope.nvim",
    tag = 'v0.2.1',
    dependencies = {
        "nvim-lua/plenary.nvim",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },

    config = function()
	    require('telescope').setup{

        extensions = {
            fzf = {}
            }
        }

        require('telescope').load_extension('fzf')

	    local builtin = require('telescope.builtin')
	    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
	    vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
	    vim.keymap.set('n', '<leader>pws', function()
		    local word = vim.fn.expand("<cword>")
		    builtin.grep_string({ search = word })
	    end)
	    vim.keymap.set('n', '<leader>pWs', function()
		    local word = vim.fn.expand("<cWORD>")
		    builtin.grep_string({ search = word })
	    end)
	    vim.keymap.set('n', '<leader>ps', function()
		    builtin.grep_string({ search = vim.fn.input("Grep > ") })
	    end)
	    vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    end
}
