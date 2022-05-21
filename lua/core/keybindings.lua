-- leader key 为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-----------------------------------------------------------------
-- 替代<ESC>
vim.keymap.set("i", "jj", "<ESC>", {noremap = true, silent = true})

-- 调节窗口大小
-- 窗口宽度增大
vim.keymap.set("n", "<leader>v=", "<cmd>res +5<cr>", {noremap = true, silent = true})
-- 窗口宽度减小
vim.keymap.set("n", "<leader>v-", "<cmd>res -5<cr>", {noremap = true, silent = true})
-- 窗口高度增大
vim.keymap.set("n", "<leader>h=", "<cmd>vertical res +5<cr>", {noremap = true, silent = true})
-- 窗口高度减小
vim.keymap.set("n", "<leader>h-", "<cmd>vertical res -5<cr>", {noremap = true, silent = true})

-- 反撤销
vim.keymap.set("n", "U", "<C-r>", {noremap = true, silent = true})

-- 行头行尾
vim.keymap.set("n", "H", "^", {noremap = true, silent = true})
vim.keymap.set("v", "H", "^", {noremap = true, silent = true})
vim.keymap.set("n", "L", "$", {noremap = true, silent = true})
vim.keymap.set("v", "L", "$", {noremap = true, silent = true})

-- 快捷翻页
vim.keymap.set("n", "J", "10j", {noremap = true, silent = true})
vim.keymap.set("n", "K", "10k", {noremap = true, silent = true})
vim.keymap.set("v", "J", "10j", {noremap = true, silent = true})
vim.keymap.set("v", "K", "10k", {noremap = true, silent = true})

--------------------------------------------------------------------
-- 插件快捷键
-- nvimTree
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>tf", ":NvimTreeFindFile<CR>", {noremap = true, silent = true})

-- bufferline
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>bp", "<cmd>BufferLinePick<cr>", {silent = true, nowait = true})
vim.keymap.set("n", "<leader>bc", "<cmd>BufferLinePickClose<cr>", {silent = true, nowait = true})
-- 选择跳转Tab
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete!<cr>", {silent = true, nowait = true})

-- hop 快速跳转
-- place this in one of your configuration file(s)
vim.keymap.set(
    "n",
    "f",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
    {}
)
vim.keymap.set(
    "n",
    "F",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
    {}
)
vim.keymap.set(
    "o",
    "f",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
    {}
)
vim.keymap.set(
    "o",
    "F",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
    {}
)
vim.keymap.set(
    "",
    "t",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
    {}
)
vim.keymap.set(
    "",
    "T",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
    {}
)
vim.keymap.set(
    "n",
    "<leader>e",
    "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>",
    {}
)
vim.keymap.set(
    "v",
    "<leader>e",
    "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>",
    {}
)
vim.keymap.set(
    "o",
    "<leader>e",
    "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END, inclusive_jump = true })<cr>",
    {}
)

-- nvim-notify
-- 显示历史弹窗记录
vim.keymap.set(
    "n",
    "<leader>nh",
    "<cmd>lua require('telescope').extensions.notify.notify()<CR>",
    {noremap = true, silent = true}
)

-- symbol-outline
-- 显示outline
vim.keymap.set("n", "<leader>o", ":SymbolsOutline<CR>", {noremap = true, silent = true})

-- lsp 快捷键
function _G.on_attach(client, bufnr)
    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- 跳转到定义（代替内置 LSP 的窗口，telescope 插件让跳转定义更方便）
    vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", {noremap = true, silent = true, buffer = bufnr})
    -- 跳转到实现
    vim.keymap.set(
        "n",
        "gD",
        "<cmd>lua vim.lsp.buf.declaration()<CR>",
        {noremap = true, silent = true, buffer = bufnr}
    )
    -- 跳转到实现（代替内置 LSP 的窗口，telescope 插件让跳转定义更方便）
    vim.keymap.set(
        "n",
        "gi",
        "<cmd>Telescope lsp_implementations<CR>",
        {noremap = true, silent = true, buffer = bufnr}
    )
    -- 跳转到type定义（代替内置 LSP 的窗口，telescope 插件让跳转定义更方便）
    vim.keymap.set(
        "n",
        "gt",
        "<cmd>Telescope lsp_type_definitions<CR>",
        {noremap = true, silent = true, buffer = bufnr}
    )
    -- 列出光标下所有引用（代替内置 LSP 的窗口，telescope 插件让查看引用更方便）
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", {noremap = true, silent = true, buffer = bufnr})
    -- 工作区诊断（代替内置 LSP 的窗口，telescope 插件让工作区诊断更方便）
    vim.keymap.set(
        "n",
        "<leader>wd",
        "<cmd>Telescope diagnostics<CR>",
        {noremap = true, silent = true, buffer = bufnr}
    )
    -- 显示代码可用操作（代替内置 LSP 的窗口，telescope 插件让代码行为更方便）
    vim.keymap.set(
        "n",
        "<leader>ca",
        "<cmd>Telescope lsp_code_actions<CR>",
        {noremap = true, silent = true, buffer = bufnr}
    )
    -- 变量重命名（代替内置 LSP 的窗口，Lspsaga 让变量重命名更美观）
    vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", {noremap = true, silent = true, buffer = bufnr})
    -- 查看帮助信息（代替内置 LSP 的窗口，Lspsaga 让查看帮助信息更美观）
    vim.keymap.set("n", "gh", "<cmd>Lspsaga hover_doc<CR>", {noremap = true, silent = true, buffer = bufnr})
    -- 跳转到上一个问题（代替内置 LSP 的窗口，Lspsaga 让跳转问题更美观）
    vim.keymap.set(
        "n",
        "[d",
        "<cmd>Lspsaga diagnostic_jump_prev<CR>",
        {noremap = true, silent = true, buffer = bufnr}
    )
    -- 跳转到下一个问题（代替内置 LSP 的窗口，Lspsaga 让跳转问题更美观）
    vim.keymap.set(
        "n",
        "]d",
        "<cmd>Lspsaga diagnostic_jump_next<CR>",
        {noremap = true, silent = true, buffer = bufnr}
    )
    --
    vim.keymap.set(
        "n",
        "<leader>sd",
        "<cmd>lua vim.diagnostic.setloclist()<CR>",
        {noremap = true, silent = true, buffer = bufnr}
    )

    require "lsp_signature".on_attach() -- Note: add in lsp client on-attach
end

-- 显示报错
vim.keymap.set("n", "<leader>ld", ":Lspsaga show_line_diagnostics<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>cd", ":Lspsaga show_cursor_diagnostics<CR>", {noremap = true, silent = true})

-- 格式化代码 Neoformat
vim.keymap.set("n", "<leader>=", "<cmd>Neoformat<CR>", {noremap = true, silent = true})

-- 回退跳转
vim.keymap.set("n", "gb", "<C-t>", {noremap = true, silent = true})

-- telescope 按键设置
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", {noremap = true, silent = true})
vim.keymap.set(
    "n",
    "<leader>fw",
    "<cmd> Telescope current_buffer_fuzzy_find<CR>",
    {noremap = true, silent = true}
)

function _G.set_terminal_keymaps()
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], {noremap = true, silent = true, buffer = 0})
    vim.keymap.set("t", "jj", [[<C-\><C-n>]], {noremap = true, silent = true, buffer = 0})
    vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-W>h]], {noremap = true, silent = true, buffer = 0})
    vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-W>j]], {noremap = true, silent = true, buffer = 0})
    vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-W>k]], {noremap = true, silent = true, buffer = 0})
    vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-W>l]], {noremap = true, silent = true, buffer = 0})
end

-- dapUI 显示或隐藏调试界面
vim.keymap.set("n", "<F3>", "<cmd>lua require'dapui'.toggle()<CR>", {noremap = true, silent = true})

-- 打断点
vim.keymap.set(
    "n",
    "<leader>db",
    "<cmd>lua require'dap'.toggle_breakpoint()<cr>",
    {noremap = true, silent = true}
)
-- 设置断点条件
vim.keymap.set(
    "n",
    "<leader>dB",
    "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>",
    {noremap = true, silent = true}
)
vim.keymap.set("n", "<leader>dr", "lua require'dap'.repl.open()<cr>", {noremap = true, silent = true})
-- 重启调试
vim.keymap.set("n", "<leader>dl", "lua require'dap'.run_last()<cr>", {noremap = true, silent = true})
-- 开启调试或到下一个断点处
vim.keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", {noremap = true, silent = true})
-- 单步跳过执行（不进入函数内部，无回溯阶段）
vim.keymap.set("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>", {noremap = true, silent = true})
-- 单步进入执行（会进入函数内部，有回溯阶段）
vim.keymap.set("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>", {noremap = true, silent = true})
-- 步出当前函数
vim.keymap.set("n", "<F12>", "<cmd>lua require'dap'.step_out()<CR>", {noremap = true, silent = true})
-- 退出调试（关闭调试，关闭 repl，关闭 ui，清除内联文本）
vim.keymap.set(
    "n",
    "<F4>",
    "<cmd>lua require'dap'.terminate()<CR><cmd>lua require'dap.repl'.close()<CR><cmd>lua require'dapui'.close()<CR><cmd>DapVirtualTextForceRefresh<CR>",
    {noremap = true, silent = true}
)

function _G.set_gitsigns_keymaps(bufnr)
    local gs = package.loaded.gitsigns

    -- Navigation
    vim.keymap.set(
        "n",
        "]c",
        function()
            if vim.wo.diff then
                return "]c"
            end
            vim.schedule(
                function()
                    gs.next_hunk()
                end
            )
            return "<Ignore>"
        end,
        {buffer = bufnr, expr = true}
    )

    vim.keymap.set(
        "n",
        "[c",
        function()
            if vim.wo.diff then
                return "[c"
            end
            vim.schedule(
                function()
                    gs.prev_hunk()
                end
            )
            return "<Ignore>"
        end,
        {buffer = bufnr, expr = true}
    )

    -- Actions
    vim.keymap.set({"n", "v"}, "<leader>hs", ":Gitsigns stage_hunk<CR>", {buffer = bufnr})
    vim.keymap.set({"n", "v"}, "<leader>hr", ":Gitsigns reset_hunk<CR>", {buffer = bufnr})
    vim.keymap.set("n", "<leader>hS", gs.stage_buffer, {buffer = bufnr})
    vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, {buffer = bufnr})
    vim.keymap.set("n", "<leader>hR", gs.reset_buffer, {buffer = bufnr})
    vim.keymap.set("n", "<leader>hp", gs.preview_hunk, {buffer = bufnr})
    vim.keymap.set(
        "n",
        "<leader>hb",
        function()
            gs.blame_line {full = true}
        end,
        {buffer = bufnr}
    )
    vim.keymap.set("n", "<leader>tb", gs.toggle_current_line_blame, {buffer = bufnr})
    vim.keymap.set("n", "<leader>hd", gs.diffthis, {buffer = bufnr})
    vim.keymap.set(
        "n",
        "<leader>hD",
        function()
            gs.diffthis("~")
        end,
        {
            buffer = bufnr
        }
        
    )
    vim.keymap.set("n", "<leader>td", gs.toggle_deleted, {buffer = bufnr})

    -- Text object
    vim.keymap.set({"o", "x"}, "ih", ":<C-U>Gitsigns select_hunk<CR>", {buffer = bufnr})
end
