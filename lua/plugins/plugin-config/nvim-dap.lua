-- https://github.com/mfussenegger/nvim-dap

-- WARN: dap 手动下载调试器
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

local dap = require("dap")
-- https://github.com/rcarriga/nvim-dap-ui
local dapui = require("dapui")
-- https://github.com/theHamsta/nvim-dap-virtual-text
local dap_virtual_text = require("nvim-dap-virtual-text")

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
        icons = {expanded = "▾", collapsed = "▸"},
        mappings = {
            -- Use a table to apply multiple mappings
            expand = {"o", "<2-LeftMouse>", "<CR>"},
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
                {id = "stacks", size = 0.35},
                {id = "watches", size = 0.15},
                {id = "breakpoints", size = 0.15}
            },
            size = 40,
            position = "left" -- Can be "left", "right", "top", "bottom"
        },
        tray = {
            elements = {"repl"},
            size = 5,
            position = "bottom" -- Can be "left", "right", "top", "bottom"
        },
        floating = {
            max_height = nil, -- These can be integers or a float between 0 and 1.
            max_width = nil, -- Floats will be treated as percentage of your screen.
            border = "single", -- Border style. Can be "single", "double" or "rounded"
            mappings = {
                close = {"q", "<Esc>"}
            }
        },
        windows = {indent = 1}
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
