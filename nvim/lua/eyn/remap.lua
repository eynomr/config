vim.g.mapleader = " "

local map = vim.keymap.set

-- File Operations
map("n", "<C-n>", ":enew<CR>", { desc = "New File" }) 
map("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle file explorer" })
map("n", "<leader>o", ":Neotree focus<CR>", { desc = "Focus file explorer" })

-- Navigation
map("n", "<leader>pv", vim.cmd.Ex, { desc = "Back to files" })
map("n", "<C-S-e>", ":Oil<CR>", { desc = "File explorer" })
map("n", "<C-b>", ":Neotree toggle dir=.<CR>", { desc = "Toggle sidebar" })
map("n", "<C-d>", "<C-d>zz", { desc = "Page down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Page up"})

-- Editor
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "<C-h>", ":%s/", { desc = "Find and replace" })
map("n", "<C-/>", "gcc", { desc = "Toggle comment", remap = true })
map("v", "<C-/>", "gc", { desc = "Toggle comment", remap = true })
map("n", "<leader>]", "<cmd>vertical resize +5<CR>", { desc = "Widen window"})
map("n", "<leader>[", "<cmd>vertical resize -5<CR>", { desc = "Narrow window"})


-- everything always in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Yank/Put Ops
vim.keymap.set("x", "<leader>p", '"_d"+P')
vim.keymap.set("n", "<leader>y" , "\"+y")
vim.keymap.set("v", "<leader>y" , "\"+y")
vim.keymap.set("n", "<leader>Y" , "\"+Y")

-- delete to void
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- this is next level
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


-- Nice things
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })


