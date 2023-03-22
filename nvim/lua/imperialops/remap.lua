vim.g.mapleader = " "

vim.keymap.set("i", "jj", "<ESC>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>s", vim.cmd.w)
vim.keymap.set("n", "<leader>w", vim.cmd.q)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- splits
vim.keymap.set("n", "<leader>vv", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>vs", vim.cmd.split)
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")
vim.keymap.set("n", "<leader>-", "<C-w>-")
vim.keymap.set("n", "<leader>=", "<C-w>+")
vim.keymap.set("n", "<leader><", "<C-w><")
vim.keymap.set("n", "<leader>>", "<C-w>>")

-- terminal
vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>")
vim.keymap.set("t", "<C-e>", "<cmd>ToggleTermToggleAll<CR>")
vim.keymap.set("t", "jk", "<C-\\><C-n><cmd>ToggleTerm<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")
vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>")

-- terminal execs
vim.keymap.set("n", "<leader>rb", '<cmd>TermExec cmd="!!"<CR>')
