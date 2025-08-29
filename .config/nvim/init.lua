-- Theme
vim.cmd.colorscheme("gruvbox")

-- Opts
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.signcolumn = 'yes'
vim.g.c_no_curly_error=1
vim.opt.guicursor = ""

-- Undo
vim.opt.swapfile = false
vim.opt.undofile = true

-- Netrw
vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 0

-- Keymaps
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>m', '<cmd>:make<CR>')
vim.keymap.set('n', 'cn', '<cmd>:cnext<CR>')
vim.keymap.set('n', 'cb', '<cmd>:cprevious<CR>')
vim.keymap.set('n', '<leader>e', '<cmd>Explore %:p:h<CR>')
vim.keymap.set('n', '<leader>ff', ':find ')
vim.keymap.set('n', '<leader>i', ':Inspect<CR>')
vim.keymap.set('n', '<leader>n', '<cmd>tabnew<CR>')
vim.keymap.set('n', '<leader>]', '<cmd>tabnext<CR>')
vim.keymap.set('n', '<leader>[', '<cmd>tabprevious<CR>')
vim.keymap.set('n', '<leader><tab>', '<cmd>tabnext #<CR>')
for i = 1, 9 do
    local key = tostring(i)
    vim.keymap.set('n', '<leader>' .. key, key .. 'gt<CR>')
end
vim.keymap.set('n', '<BS>', '<C-o>')
vim.keymap.set('n', '\\', '<C-i>')

-- Formatters
local function run_format_commands(commands, filename)
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    for _, command in ipairs(commands) do
        local result = vim.fn.system(command .. vim.fn.shellescape(filename))
        if not vim.v.shell_error == 0 then
            print("Failed running formatter: " .. result)
            return
        end
    end
    vim.api.nvim_win_set_cursor(0, cursor_pos)
end

local function format_python(filename)
    local format_commands = {
        "black --quiet ",
        "isort --profile black ",
    }
    run_format_commands(format_commands, filename)
end

FORMATTERS = {
    lua = vim.lsp.buf.format,
    python = format_python,
}

local function format()
    local bufnr = vim.api.nvim_get_current_buf()
    local filename = vim.api.nvim_buf_get_name(bufnr)
    local filetype = vim.bo[bufnr].filetype
    local format_func = FORMATTERS[filetype]
    if format_func == nil then
        print(string.format("No formatter found for %s", filetype))
        return
    end
    format_func(filename)
end

vim.api.nvim_create_user_command("Format", format, {})

-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set('n', '<leader>fm', format, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gs', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '.', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', ',', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', '<leader>w', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
    end,
})

LSPS = {
    lua_ls = {
        settings = {
            Lua = {
                format = { enable = true },
                diagnostics = {
                    globals = { "vim" },
                },
            },
        }
    },
    pyright = {},
    rust_analyzer = {
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = true,
                check = {
                    command = "clippy",
                    extraArgs = { "--no-deps" },
                },
            },
        }
    },
}

for name, opts in pairs(LSPS) do
    vim.lsp.enable(name)
    vim.lsp.config(name, opts)
end
