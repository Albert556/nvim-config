local null_ls = require("null-ls")

local code_actions = null_ls.builtins.code_actions
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
local hover = null_ls.builtins.hover
local completion = null_ls.builtins.completion

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local sources = {
    -- Filetypes: { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" }
    code_actions.eslint_d,
    -- git
    code_actions.gitsigns,
    -- sh
    code_actions.shellcheck,

    completion.spell,
    completion.vsnip,

    -- make
    -- diagnostics.checkmake,
    -- cpp
    diagnostics.cppcheck,
    -- Filetypes: { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" }
    diagnostics.eslint_d,
    -- go
    diagnostics.golangci_lint,
    -- python
    diagnostics.pylint,
    -- shell
    diagnostics.shellcheck,

    -- toml
    formatting.taplo,
    -- lua
    formatting.stylua,
    -- font
    formatting.prettierd,
    -- Filetypes: { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" }
    formatting.eslint_d,
    -- python
    formatting.autopep8,
    -- import sort
    formatting.isort,
    -- go
    formatting.gofmt,
    formatting.goimports,
    formatting.golines,
    -- shell
    formatting.shfmt,
    -- c++
    formatting.clang_format,
    -- cmake
    formatting.cmake_format,
    -- dart
    formatting.dart_format,
    -- rust
    formatting.rustfmt,
}

null_ls.setup(
    {
        sources = sources,
        on_attach = function(client, bufnr)
            -- NOTE: 如果想要禁止某种语言在save时format，可以添加判定
            -- if client.name == "xxx" then
            --
            -- end
            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                        -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                        vim.lsp.buf.formatting_sync()
                    end,
                })
            end
        end,
    }
)

-- Choosing a client for formatting
-- local callback = function()
--     vim.lsp.buf.format({
--         bufnr = bufnr,
--         filter = function(client)
--             return client.name == "null-ls"
--         end
--     })
-- end,
