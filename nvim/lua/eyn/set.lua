vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.lazyredraw = false
vim.opt.ttyfast = true
vim.api.nvim_create_autocmd("VimResized", {
    callback = function ()
        vim.cmd("wincmd = ")
        vim.cmd("redraw!")
    end
})
vim.api.nvim_create_autocmd("TermOpen", {
    callback = function ()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"
        vim.opt_local_scrolloff = 0
    end
})

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

vim.opt.splitright = true
vim.opt.splitbelow = true

-- see subsitutions live!
vim.opt.inccommand = 'split'
