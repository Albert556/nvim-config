-- leader key 为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-----------------------------------------------------------------
-- 替代<ESC>
vim.api.nvim_set_keymap("i", "jj", "<ESC>", {noremap = true, silent = true})

-- 调节窗口大小
-- 窗口宽度增大
vim.api.nvim_set_keymap("n", "<leader>v=", "<cmd>res +5<cr>", {noremap = true, silent = true})
-- 窗口宽度减小
vim.api.nvim_set_keymap("n", "<leader>v-", "<cmd>res -5<cr>", {noremap = true, silent = true})
-- 窗口高度增大
vim.api.nvim_set_keymap("n", "<leader>h=", "<cmd>vertical res +5<cr>", {noremap = true, silent = true})
-- 窗口高度减小
vim.api.nvim_set_keymap("n", "<leader>h-", "<cmd>vertical res -5<cr>", {noremap = true, silent = true})

-- 切换分屏
vim.keymap.set("n", "<leader>ww", "<C-w>w", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>wh", "<C-w>h", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>wj", "<C-w>j", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>wk", "<C-w>k", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>wl", "<C-w>l", {noremap = true, silent = true})

-- 反撤销
vim.api.nvim_set_keymap("n", "U", "<C-r>", {noremap = true, silent = true})

-- 行头行尾
vim.api.nvim_set_keymap("n", "H", "^", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "H", "^", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "L", "$", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "L", "$", {noremap = true, silent = true})

-- 快捷翻页
vim.api.nvim_set_keymap("n", "J", "10j", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "K", "10k", {noremap = true, silent = true})

--------------------------------------------------------------------
-- 插件快捷键
-- nvimTree
vim.api.nvim_set_keymap("n", "<leader>t", ":NvimTreeToggle<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>tf", ":NvimTreeFindFile<CR>", {noremap = true, silent = true})

-- bufferline
vim.api.nvim_set_keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>bp", "<cmd>BufferLinePick<cr>", {silent = true, nowait = true})
vim.api.nvim_set_keymap("n", "<leader>bc", "<cmd>BufferLinePickClose<cr>", {silent = true, nowait = true})
-- 选择跳转
vim.api.nvim_set_keymap("n", "<leader>bd", "<cmd>bdelete!<cr>", {silent = true, nowait = true})
-- nvim-notify
-- 显示历史弹窗记录
vim.api.nvim_set_keymap(
    "n",
    "<leader>nh",
    "<cmd>lua require('telescope').extensions.notify.notify()<CR>",
    {noremap = true, silent = true}
)

-- symbol-outline
-- 显示outline
vim.api.nvim_set_keymap("n", "<leader>o", ":SymbolsOutline<CR>", {noremap = true, silent = true})

-- lsp 快捷键
function _G.on_attach(client, bufnr)
    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- 跳转到定义（代替内置 LSP 的窗口，telescope 插件让跳转定义更方便）
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>Telescope lsp_definitions<CR>", {noremap = true, silent = true})
    -- 跳转到实现
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "gD",
        "<cmd>lua vim.lsp.buf.declaration()<CR>",
        {noremap = true, silent = true}
    )
    -- 跳转到实现（代替内置 LSP 的窗口，telescope 插件让跳转定义更方便）
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "gi",
        "<cmd>Telescope lsp_implementations<CR>",
        {noremap = true, silent = true}
    )
    -- 跳转到type定义（代替内置 LSP 的窗口，telescope 插件让跳转定义更方便）
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "gt",
        "<cmd>Telescope lsp_type_definitions<CR>",
        {noremap = true, silent = true}
    )
    -- 列出光标下所有引用（代替内置 LSP 的窗口，telescope 插件让查看引用更方便）
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>Telescope lsp_references<CR>", {noremap = true, silent = true})
    -- 工作区诊断（代替内置 LSP 的窗口，telescope 插件让工作区诊断更方便）
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<leader>wd",
        "<cmd>Telescope diagnostics<CR>",
        {noremap = true, silent = true}
    )
    -- 显示代码可用操作（代替内置 LSP 的窗口，telescope 插件让代码行为更方便）
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<leader>ca",
        "<cmd>Telescope lsp_code_actions<CR>",
        {noremap = true, silent = true}
    )
    -- 变量重命名（代替内置 LSP 的窗口，Lspsaga 让变量重命名更美观）
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>Lspsaga rename<CR>", {noremap = true, silent = true})
    -- 查看帮助信息（代替内置 LSP 的窗口，Lspsaga 让查看帮助信息更美观）
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gh", "<cmd>Lspsaga hover_doc<CR>", {noremap = true, silent = true})
    -- 跳转到上一个问题（代替内置 LSP 的窗口，Lspsaga 让跳转问题更美观）
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "[d",
        "<cmd>Lspsaga diagnostic_jump_prev<CR>",
        {noremap = true, silent = true}
    )
    -- 跳转到下一个问题（代替内置 LSP 的窗口，Lspsaga 让跳转问题更美观）
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "]d",
        "<cmd>Lspsaga diagnostic_jump_next<CR>",
        {noremap = true, silent = true}
    )
    --
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<leader>sd",
        "<cmd>lua vim.diagnostic.setloclist()<CR>",
        {noremap = true, silent = true}
    )

    require "lsp_signature".on_attach() -- Note: add in lsp client on-attach
end

-- 显示报错
vim.api.nvim_set_keymap("n", "<leader>ld", ":Lspsaga show_line_diagnostics<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>cd", ":Lspsaga show_cursor_diagnostics<CR>", {noremap = true, silent = true})

-- 格式化代码 Neoformat
vim.api.nvim_set_keymap("n", "<leader>=", "<cmd>Neoformat<CR>", {noremap = true, silent = true})

-- 回退跳转
vim.api.nvim_set_keymap("n", "gb", "<C-t>", {noremap = true, silent = true})

-- telescope 按键设置
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap(
    "n",
    "<leader>fw",
    "<cmd> Telescope current_buffer_fuzzy_find<CR>",
    {noremap = true, silent = true}
)

function _G.set_terminal_keymaps()
    vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, "t", "jj", [[<C-\><C-n>]], {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], {noremap = true, silent = true})
end

-- dapUI 显示或隐藏调试界面
vim.api.nvim_set_keymap("n", "<F3>", "<cmd>lua require'dapui'.toggle()<CR>", {noremap = true, silent = true})

-- 打断点
vim.api.nvim_set_keymap(
    "n",
    "<leader>db",
    "<cmd>lua require'dap'.toggle_breakpoint()<cr>",
    {noremap = true, silent = true}
)
-- 设置断点条件
vim.api.nvim_set_keymap(
    "n",
    "<leader>dB",
    "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>",
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap("n", "<leader>dr", "lua require'dap'.repl.open()<cr>", {noremap = true, silent = true})
-- 重启调试
vim.api.nvim_set_keymap("n", "<leader>dl", "lua require'dap'.run_last()<cr>", {noremap = true, silent = true})
-- 开启调试或到下一个断点处
vim.api.nvim_set_keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", {noremap = true, silent = true})
-- 单步跳过执行（不进入函数内部，无回溯阶段）
vim.api.nvim_set_keymap("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>", {noremap = true, silent = true})
-- 单步进入执行（会进入函数内部，有回溯阶段）
vim.api.nvim_set_keymap("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>", {noremap = true, silent = true})
-- 步出当前函数
vim.api.nvim_set_keymap("n", "<F12>", "<cmd>lua require'dap'.step_out()<CR>", {noremap = true, silent = true})
-- 退出调试（关闭调试，关闭 repl，关闭 ui，清除内联文本）
vim.api.nvim_set_keymap(
    "n",
    "<F4>",
    "<cmd>lua require'dap'.terminate()<CR><cmd>lua require'dap.repl'.close()<CR><cmd>lua require'dapui'.close()<CR><cmd>DapVirtualTextForceRefresh<CR>",
    {noremap = true, silent = true}
)

function _G.set_gitsigns_keymaps(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map(
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
        {expr = true}
    )

    map(
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
        {expr = true}
    )

    -- Actions
    map({"n", "v"}, "<leader>hs", ":Gitsigns stage_hunk<CR>")
    map({"n", "v"}, "<leader>hr", ":Gitsigns reset_hunk<CR>")
    map("n", "<leader>hS", gs.stage_buffer)
    map("n", "<leader>hu", gs.undo_stage_hunk)
    map("n", "<leader>hR", gs.reset_buffer)
    map("n", "<leader>hp", gs.preview_hunk)
    map(
        "n",
        "<leader>hb",
        function()
            gs.blame_line {full = true}
        end
    )
    map("n", "<leader>tb", gs.toggle_current_line_blame)
    map("n", "<leader>hd", gs.diffthis)
    map(
        "n",
        "<leader>hD",
        function()
            gs.diffthis("~")
        end
    )
    map("n", "<leader>td", gs.toggle_deleted)

    -- Text object
    map({"o", "x"}, "ih", ":<C-U>Gitsigns select_hunk<CR>")
end
