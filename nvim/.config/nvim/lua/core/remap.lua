set = vim.keymap.set

vim.g.mapleader = " "

set("n", "<leader>pv", ":q<CR>")
set("n", "<leader>jq", ":%!jq .<CR>")

set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

set("n", "J", "mzJ`z")
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")


set("n", "Q", "<nop>")
set("n", "<leader>f", vim.lsp.buf.format)

set("n", "<C-k>", "<cmd>cnext<CR>zz")
set("n", "<C-j>", "<cmd>cprev<CR>zz")
set("n", "<leader>k", "<cmd>lnext<CR>zz")
set("n", "<leader>j", "<cmd>lprev<CR>zz")

set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")
set("n", "<leader>ee", "opub fn main() !void {<CR>}<Esc>O")

set("n", "<leader>r", "<cmd>RangerOpenCurrentDir<CR>")

set("n", "<leader>lp", "<cmd>LivePreview start<CR>")

set("n", "<leader>pw", "<cmd>set wrap!<CR>")

set("n", "<Esc>", "<cmd>nohlsearch<CR>")

set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

