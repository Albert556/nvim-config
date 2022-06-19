-- https://github.com/lewis6991/gitsigns.nvim
-- git blame，简单操作

local pluginName = "gitsigns"
local gitsigns, ok = pall(require, pluginName)
if not ok then
    vim.notify(pluginName.." load error", WARN)
    return
end

gitsigns.setup {
    signs = {
        add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" }
    },
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
        interval = 1000,
        follow_files = true
    },
    attach_to_untracked = true,
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false
    },
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000,
    preview_config = {
        -- Options passed to nvim_open_win
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1
    },
    yadm = {
        enable = false
    },
    -- keymap
    on_attach = function(bufnr)
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
                    package.loaded.gitsigns.next_hunk()
                end
                )
                return "<Ignore>"
            end,
            { buffer = bufnr, expr = true }
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
                    package.loaded.gitsigns.prev_hunk()
                end
                )
                return "<Ignore>"
            end,
            { buffer = bufnr, expr = true }
        )

        -- Actions
        vim.keymap.set({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", { buffer = bufnr })
        vim.keymap.set({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", { buffer = bufnr })
        vim.keymap.set("n", "<leader>hS", package.loaded.gitsigns.stage_buffer, { buffer = bufnr })
        vim.keymap.set("n", "<leader>hu", package.loaded.gitsigns.undo_stage_hunk, { buffer = bufnr })
        vim.keymap.set("n", "<leader>hR", package.loaded.gitsigns.reset_buffer, { buffer = bufnr })
        vim.keymap.set("n", "<leader>hp", package.loaded.gitsigns.preview_hunk, { buffer = bufnr })
        vim.keymap.set(
            "n",
            "<leader>hb",
            function()
                package.loaded.gitsigns.blame_line { full = true }
            end,
            { buffer = bufnr }
        )
        vim.keymap.set("n", "<leader>tb", package.loaded.gitsigns.toggle_current_line_blame, { buffer = bufnr })
        vim.keymap.set("n", "<leader>hd", package.loaded.gitsigns.diffthis, { buffer = bufnr })
        vim.keymap.set(
            "n",
            "<leader>hD",
            function()
                package.loaded.gitsigns.diffthis("~")
            end,
            {
            buffer = bufnr
        }
        )
        vim.keymap.set("n", "<leader>td", package.loaded.gitsigns.toggle_deleted, { buffer = bufnr })

        -- Text object
        vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { buffer = bufnr })
    end
}
