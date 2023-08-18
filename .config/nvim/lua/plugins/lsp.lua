require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "gopls", "quick_lint_js", "cssls", "html" }
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
require("lspconfig").gopls.setup {}
require("lspconfig").quick_lint_js.setup {}
require("lspconfig").cssls.setup {}
require("lspconfig").html.setup {}
