local bufferline = require("bufferline")

bufferline.setup(
    {
        options = {
            diagnostics = "nvim_lsp",
            -- 左侧让出 nvim-tree 的位置
            offsets = {
                {
                    filetype = "NvimTree",
                    text = function()
                        return vim.fn.getcwd()
                    end,
                    highlight = "Directory",
                    text_align = "left"
                }
            },
        }
    }
)
