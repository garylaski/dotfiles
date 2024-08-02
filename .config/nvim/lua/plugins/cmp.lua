require("cmp").setup({
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
    },
})
vim.opt.completeopt = { "menu", "menuone", "noselect" }
