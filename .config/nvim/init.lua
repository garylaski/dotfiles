vim.wo.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.hlsearch = false
vim.g.mapleader = " "
vim.o.wildmenu = true

vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>n", function() 
    vim.cmd.tabnew() 
    vim.cmd.Ex()
end)

vim.opt.path:append("**")

