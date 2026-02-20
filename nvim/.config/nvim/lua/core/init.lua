require("core.remap")
require("core.set")
require("core.lazy")

local autocmd = vim.api.nvim_create_autocmd

autocmd({ 'BufEnter', 'VimLeavePre' }, {
    group = SirenzRenameStatus,
    pattern = "*",
    callback = function(args)
        if args.event == "BufEnter" then
            local filename = vim.fn.expand("%:t")
            local cmd = string.format("tmux rename-window " .. vim.fn.shellescape(filename))
            vim.fn.jobstart(cmd, { detatch = true })
        elseif args.event == "VimLeavePre" then
            vim.fn.system("tmux set-window-option automatic-rename")
        end
    end,
})

autocmd({ 'CmdlineEnter', "CmdlineLeave" }, {
    group = SirenzCmdLineToggle,
    callback = function(args)
        if args.event == "CmdlineEnter" then
            vim.opt.cmdheight = 1
        elseif args.event == "CmdlineLeave" then
            vim.opt.cmdheight = 0
        end
    end,
})

autocmd('LspAttach', {
    group = SirenzLspAttach,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>eh", function() vim.lsp.inlay_hint.enable() end, opts)
        vim.keymap.set("n", "<leader>dh", function() vim.lsp.inlay_hint.enable(false) end, opts)
    end
})

vim.lsp.enable('zls')
