-- https://github.com/williamboman/nvim-lsp-installer
-- lsp快速安装

local pluginName = "nvim-lsp-installer"
local ok, lsp_installer = pcall(require, pluginName)
if not ok then
    vim.notify(pluginName.." load error", WARN)
    return
end

lsp_installer.settings(
    {
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
}
)

-- keymap
local on_attach = function(client, bufnr)
    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- 跳转到定义（代替内置 LSP 的窗口，telescope 插件让跳转定义更方便）
    vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { noremap = true, silent = true, buffer = bufnr })
    -- 跳转到实现
    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true, buffer = bufnr })
    -- 跳转到实现（代替内置 LSP 的窗口，telescope 插件让跳转定义更方便）
    vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { noremap = true, silent = true, buffer = bufnr })
    -- 跳转到type定义（代替内置 LSP 的窗口，telescope 插件让跳转定义更方便）
    vim.keymap.set(
        "n",
        "gt",
        "<cmd>Telescope lsp_type_definitions<CR>",
        { noremap = true, silent = true, buffer = bufnr }
    )
    -- 列出光标下所有引用（代替内置 LSP 的窗口，telescope 插件让查看引用更方便）
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", { noremap = true, silent = true, buffer = bufnr })
    -- 查看帮助信息（代替内置 LSP 的窗口，Lspsaga 让查看帮助信息更美观）
    vim.keymap.set("n", "gh", "<cmd>Lspsaga hover_doc<CR>", { noremap = true, silent = true, buffer = bufnr })

    vim.keymap.set("n", "<leader>lf", "<cmd>Lspsaga lsp_finder<CR>", { noremap = true, silent = true, buffer = bufnr })
    -- 显示代码可用操作（代替内置 LSP 的窗口，telescope 插件让代码行为更方便）
    vim.keymap.set("n", "gx", "<cmd>Lspsaga code_action<CR>", { noremap = true, silent = true, buffer = bufnr })
    vim.keymap.set("x", "gx", "<cmd>Lspsaga range_code_action<CR>", { noremap = true, silent = true, buffer = bufnr })
    -- 变量重命名（代替内置 LSP 的窗口，Lspsaga 让变量重命名更美观）
    vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { noremap = true, silent = true, buffer = bufnr })

    vim.keymap.set(
        "n",
        "<leader>=",
        "<cmd>lua vim.lsp.buf.formatting()<CR>",
        { noremap = true, silent = true, buffer = bufnr }
    )
    vim.keymap.set(
        "n",
        "<C-k>",
        "<cmd>lua vim.lsp.buf.signature_help()<CR>",
        { noremap = true, silent = true, buffer = bufnr }
    )
    vim.keymap.set(
        "n",
        "<leader>wa",
        "<cmd>lua vim.lsp.buf.add_workleader_folder()<CR>",
        { noremap = true, silent = true, buffer = bufnr }
    )
    vim.keymap.set(
        "n",
        "<leader>wr",
        "<cmd>lua vim.lsp.buf.remove_workleader_folder()<CR>",
        { noremap = true, silent = true, buffer = bufnr }
    )
    vim.keymap.set(
        "n",
        "<leader>wl",
        "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workleader_folders()))<CR>",
        { noremap = true, silent = true, buffer = bufnr }
    )

    -- 额外的keymap配置
    -- 跳转到上一个问题（代替内置 LSP 的窗口，Lspsaga 让跳转问题更美观）
    vim.keymap.set("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { noremap = true, silent = true, buffer = bufnr })
    -- 跳转到下一个问题（代替内置 LSP 的窗口，Lspsaga 让跳转问题更美观）
    vim.keymap.set("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", { noremap = true, silent = true, buffer = bufnr })
    -- 工作区诊断（代替内置 LSP 的窗口，telescope 插件让工作区诊断更方便）
    vim.keymap.set("n", "<leader>wd", "<cmd>Telescope diagnostics<CR>", { noremap = true, silent = true, buffer = bufnr })
    -- 当前文件的诊断
    vim.keymap.set(
        "n",
        "<leader>sd",
        "<cmd>lua vim.diagnostic.setloclist()<CR>",
        { noremap = true, silent = true, buffer = bufnr }
    )
    -- 行诊断
    vim.keymap.set(
        "n",
        "<leader>ld",
        "<cmd>Lspsaga show_line_diagnostics<CR>",
        { noremap = true, silent = true, buffer = bufnr }
    )
    -- 光标处诊断
    vim.keymap.set(
        "n",
        "<leader>cd",
        "<cmd>Lspsaga show_cursor_diagnostics<CR>",
        { noremap = true, silent = true, buffer = bufnr }
    )

    vim.keymap.set(
        "n",
        "<C-k>",
        "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>",
        { noremap = true, silent = true, buffer = bufnr }
    )
    vim.keymap.set(
        "n",
        "<C-j>",
        "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>",
        { noremap = true, silent = true, buffer = bufnr }
    )

    require "lsp_signature".on_attach() -- Note: add in lsp client on-attach
end


-- 使用 cmp_nvim_lsp 代替内置 omnifunc，获得更强的补全体验
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_nvim_lsp then
    capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
else
    vim.notify("cmp_nvim_lsp load error", WARN)
end

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
    opts.on_attach = on_attach
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
