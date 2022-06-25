-- https://github.com/mfussenegger/nvim-dap

-- WARN: dap 手动下载调试器
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

local pluginName = "dap"
local ok, dap = pcall(require, pluginName)
if not ok then
    vim.notify(pluginName.." load error", WARN)
    return
end

-- https://github.com/rcarriga/nvim-dap-ui
local pluginName = "dapui"
local ok, dapui = pcall(require, pluginName)
if not ok then
    vim.notify(pluginName.." load error", WARN)
    return
end

-- https://github.com/theHamsta/nvim-dap-virtual-text
local pluginName = "nvim-dap-virtual-text"
local ok, dap_virtual_text = pcall(require, pluginName)
if not ok then
    vim.notify(pluginName.." load error", WARN)
    return
end

-- 设置断点样式
local dap_breakpoint = {
    error = {
        text = "🛑",
        texthl = "LspDiagnosticsSignError",
        linehl = "",
        numhl = ""
    },
    rejected = {
        text = "",
        texthl = "LspDiagnosticsSignHint",
        linehl = "",
        numhl = ""
    },
    stopped = {
        text = "⭐️",
        texthl = "LspDiagnosticsSignInformation",
        linehl = "DiagnosticUnderlineInfo",
        numhl = "LspDiagnosticsSignInformation"
    }
}

vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)

-- 加载调试器配置
local dap_config = {
    lua = require("plugins.dap.lua"),
    python = require("plugins.dap.python"),
    go = require("plugins.dap.go"),
    codelldb = require("plugins.dap.codelldb"),
    c = require("plugins.dap.c"),
    cpp = require("plugins.dap.cpp"),
    rust = require("plugins.dap.rust")
}

-- 设置调试器
for dap_name, dap_options in pairs(dap_config) do
    if dap_options.adapters then
        dap.adapters[dap_name] = dap_options.adapters
    end
    if dap_options.configurations then
        dap.configurations[dap_name] = dap_options.configurations
    end
end

-- 初始化调试界面
dapui.setup(
    {
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "o", "<2-LeftMouse>", "<CR>" },
        open = "O",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t"
    },
    sidebar = {
        -- You can change the order of elements in the sidebar
        elements = {
            -- Provide as ID strings or tables with "id" and "size" keys
            {
                id = "scopes",
                size = 0.35 -- Can be float or integer > 1
            },
            { id = "stacks", size = 0.35 },
            { id = "watches", size = 0.15 },
            { id = "breakpoints", size = 0.15 }
        },
        size = 40,
        position = "left" -- Can be "left", "right", "top", "bottom"
    },
    tray = {
        elements = { "repl" },
        size = 5,
        position = "bottom" -- Can be "left", "right", "top", "bottom"
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { "q", "<Esc>" }
        }
    },
    windows = { indent = 1 }
}
)

-- 如果开启或关闭调试，则自动打开或关闭调试界面
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
    dap.repl.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
    dap.repl.close()
end

dap_virtual_text.setup(
    {
    enabled = true, -- enable this plugin (the default)
    enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = true, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true, -- show stop reason when stopped for exceptions
    commented = false, -- prefix virtual text with comment string
    -- experimental features:
    virt_text_pos = "eol", -- position of virtual text, see `:h nvim_buf_set_extmark()`
    all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil -- position the virtual text at a fixed window column (starting from the first text column) ,
    -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}
)

-- keymap
-- dapUI 显示或隐藏调试界面
vim.keymap.set("n", "<F3>", "<cmd>lua require'dapui'.toggle()<CR>", { noremap = true, silent = true })

-- 打断点
vim.keymap.set(
    "n",
    "<leader>db",
    "<cmd>lua require'dap'.toggle_breakpoint()<cr>",
    { noremap = true, silent = true }
)
-- 设置断点条件
vim.keymap.set(
    "n",
    "<leader>dB",
    "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>",
    { noremap = true, silent = true }
)
vim.keymap.set("n", "<leader>dr", "lua require'dap'.repl.open()<cr>", { noremap = true, silent = true })
-- 重启调试
vim.keymap.set("n", "<leader>dl", "lua require'dap'.run_last()<cr>", { noremap = true, silent = true })
-- 开启调试或到下一个断点处
vim.keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", { noremap = true, silent = true })
-- 单步跳过执行（不进入函数内部，无回溯阶段）
vim.keymap.set("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>", { noremap = true, silent = true })
-- 单步进入执行（会进入函数内部，有回溯阶段）
vim.keymap.set("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>", { noremap = true, silent = true })
-- 步出当前函数
vim.keymap.set("n", "<F12>", "<cmd>lua require'dap'.step_out()<CR>", { noremap = true, silent = true })
-- 退出调试（关闭调试，关闭 repl，关闭 ui，清除内联文本）
vim.keymap.set(
    "n",
    "<F4>",
    "<cmd>lua require'dap'.terminate()<CR><cmd>lua require'dap.repl'.close()<CR><cmd>lua require'dapui'.close()<CR><cmd>DapVirtualTextForceRefresh<CR>",
    { noremap = true, silent = true }
)
