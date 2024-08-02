require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "gopls", "quick_lint_js", "cssls", "pyright", "rust_analyzer" },
})

require("lspconfig").lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
}
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white]]
local border = {
      {"🭽", "FloatBorder"},
      {"▔", "FloatBorder"},
      {"🭾", "FloatBorder"},
      {"▕", "FloatBorder"},
      {"🭿", "FloatBorder"},
      {"▁", "FloatBorder"},
      {"🭼", "FloatBorder"},
      {"▏", "FloatBorder"},
}
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
require("lspconfig").gopls.setup {
    staticcheck = true,
}
require("lspconfig").quick_lint_js.setup {}
require("lspconfig").cssls.setup {}
require("lspconfig").html.setup {}
require("lspconfig").pyright.setup {}
require("lspconfig").rust_analyzer.setup {
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy",
                extraArgs = { "--no-deps" },
            },
        },
    },
}
require("lspconfig").jdtls.setup({})
