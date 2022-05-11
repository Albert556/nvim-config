local null_ls = require("null-ls")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

null_ls.setup(
    {
    sources = {
        completion.spell,
        -- lua
        formatting.stylua,
        -- diagnostics.selene,
        -- front
        formatting.prettier,
        diagnostics.eslint,
        -- python
        formatting.autopep8,
        -- go
        formatting.gofmt,
        -- shell
        formatting.shfmt,
        -- c++
        formatting.clang_format,
        -- cmake
        formatting.cmake_format,
        -- dart
        formatting.dart_format,
        -- markdown
        formatting.codespell.with({ filetypes = { "markdown" } }),
        -- rust
        formatting.rustfmt
    },
    on_attach = function(client)
        if client.server_capabilities.documentFormattingProvider then
            vim.cmd([[ 
                augroup lspFormat
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting() 
                augroup END
                ]])
        end
    end,
}
)
