-- require'lspconfig'.gopls.setup{}
return {
    root_dir = function()
        return vim.fn.getcwd()
    end
}
