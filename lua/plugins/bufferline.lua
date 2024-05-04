local M = {
      "akinsho/bufferline.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    event = "User IceLoad",
    opts = {
        options = {
            close_command = ":BufferLineClose %d",
            right_mouse_command = ":BufferLineClose %d",
            separator_style = "thin",
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "left",
                },
            },
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(_, _, diagnostics_dict, _)
                local s = " "
                for e, n in pairs(diagnostics_dict) do
                    local sym = e == "error" and symbols.Error or (e == "warning" and symbols.Warn or symbols.Info)
                    s = s .. n .. sym
                end
                return s
            end,
        },
    },
    config = function(_, opts)
        vim.api.nvim_create_user_command("BufferLineClose", function(buffer_line_opts)
            local bufnr = 1 * buffer_line_opts.args
            local buf_is_modified = vim.api.nvim_buf_get_option(bufnr, "modified")

            local bdelete_arg
            if bufnr == 0 then
                bdelete_arg = ""
            else
                bdelete_arg = " " .. bufnr
            end
            local command = "bdelete!" .. bdelete_arg
            if buf_is_modified then
                local option = vim.fn.confirm("File is not saved. Close anyway?", "&Yes\n&No", 2)
                if option == 1 then
                    vim.cmd(command)
                end
            else
                vim.cmd(command)
            end
        end, { nargs = 1 })

        require("bufferline").setup(opts)
    end,
    keys = {
        { "<leader>bc", ":BufferLinePickClose<CR>", desc = "pick close", silent = true, noremap = true },
        -- <esc> is added in case current buffer is the last
        { "<leader>bd", ":BufferLineClose 0<CR><ESC>", desc = "close current buffer", silent = true, noremap = true },
        { "<leader>bh", ":BufferLineCyclePrev<CR>", desc = "prev buffer", silent = true, noremap = true },
        { "<leader>bl", ":BufferLineCycleNext<CR>", desc = "next buffer", silent = true, noremap = true },
        { "<leader>bo", ":BufferLineCloseOthers<CR>", desc = "close others", silent = true, noremap = true },
        { "<leader>bp", ":BufferLinePick<CR>", desc = "pick buffer", silent = true, noremap = true },
    },
}

return M
