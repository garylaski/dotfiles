local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
local plugins = {
     "github/copilot.vim",
     "nvim-treesitter/nvim-treesitter",
     "williamboman/mason.nvim",
     "williamboman/mason-lspconfig.nvim",
     "neovim/nvim-lspconfig",
     "ellisonleao/gruvbox.nvim",
     "vimwiki/vimwiki",
}
vim.opt.rtp:prepend(lazypath)
require("lazy").setup(plugins)
require("plugins/treesitter")
require("plugins/lsp")
require("plugins/gruvbox")
require("plugins/copilot")
