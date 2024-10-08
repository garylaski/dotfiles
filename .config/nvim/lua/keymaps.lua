vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>e', '<cmd>Explore<CR>')
vim.keymap.set('n', '<leader>n', '<cmd>tabnew<CR>')
vim.keymap.set({'n', 'i', 'v'}, '<up>', '<nop>')
vim.keymap.set({'n', 'i', 'v'}, '<down>', '<nop>')
vim.keymap.set({'n', 'i', 'v'}, '<left>', '<nop>')
vim.keymap.set({'n', 'i', 'v'}, '<right>', '<nop>')
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>')
vim.keymap.set('n', '<leader>]', '<cmd>tabnext<CR>')
vim.keymap.set('n', '<leader>[', '<cmd>tabprevious<CR>')
vim.keymap.set('n', '<leader><tab>', '<cmd>tabnext #<CR>')
for i = 1, 9 do
   local key = tostring(i)
   vim.keymap.set('n', '<leader>' ..key, key.. 'gt<CR>')
end
vim.keymap.set('n', '<leader>w', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '<BS>', '<C-o>')
vim.keymap.set('n', '\\', '<C-i>')
vim.keymap.set('n', '.', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', ',', '<cmd>lua vim.diagnostic.goto_prev()<CR>')

function UpdateAll ()
    require('lazy').sync({show = false})
    require('mason-registry').update()
    vim.cmd('TSUpdate')
end

vim.keymap.set('n', '<leader>u', UpdateAll)
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>')
