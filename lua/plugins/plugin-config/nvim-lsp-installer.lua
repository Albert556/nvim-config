local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings(
    {
        ui = {
            icons = {
                server_installed = "✓",
                server_pending = "➜",
                server_uninstalled = "✗"
            }
        }
    }
)
-- 使用 cmp_nvim_lsp 代替内置 omnifunc，获得更强的补全体验
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
-- 代替内置 omnifunc

-- server list
local servers = {
    -- c++
    clangd = require("plugins/lsp/cpp"),
    -- cmake
    cmake = require("plugins/lsp/cmake"),
    -- go
    gopls = require("plugins/lsp/go"),
    -- lua
    sumneko_lua = require("plugins/lsp/lua"),
    -- python
    pyright = require("plugins/lsp/python"),
    -- rust
    rust_analyzer = require("plugins/lsp/rust")
}

-- 自动安装 LanguageServers
for lsp, _ in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(lsp)
    if server_is_found then
        if server:is_installed() then
        else
            vim.notify("Installing " .. lsp)
            server:install()
        end
    else
        vim.notify(lsp .. "not found")
    end
end

lsp_installer.on_server_ready(
    function(server)
        local server_name = server.name
        local opts = servers[server_name]
        if opts == nil then
            return
        end
        opts.on_attach = _G.on_attach
        opts.flags = {
            debounce_text_changes = 150
        }
        opts.capabilities = capabilities

        if server_name == "rust_analyzer" then
            -- Only if standalone support is needed
            -- require("rust-tools").start_standalone_if_requird()
            -- Initialize the LSP via rust-tools instead
            --
            -- Update this path
            local extension_path = vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-1.6.7/"
            local codelldb_path = extension_path .. "adapter/codelldb"
            local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

            require("rust-tools").setup(
                {
                    -- The "server" property provided in rust-tools setup function are the
                    -- settings rust-tools will provide to lspconfig during init.            --
                    -- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
                    -- with the user's own settings (opts).
                    server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
                    dap = {
                        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
                    }
                }
            )
            server:attach_buffers()
        else
            server:setup(opts)
        end
    end
)
