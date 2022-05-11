vim.cmd(
[[ 
" vim-sneak
let g:sneak#label = 1

" https://github.com/sbdchd/neoformat

" WARN: neoformat 手动安装各语言的代码格式化程序
" https://github.com/sbdchd/neoformat"supported-filetypes

" 当没有找到格式化程序时，将按照如下方式自动格式化
" 1.自动对齐
" let g:neoformat_basic_format_align = 1
" 2.自动删除行尾空格
" let g:neoformat_basic_format_trim = 1
" 3.将制表符替换为空格
" let g:neoformat_basic_format_retab = 0

" 只提示错误消息
" let g:neoformat_only_msg_on_error = 1

" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup END

" python
let g:neoformat_enabled_python = ['yapf']

" 安装格式化插件
" lua"
" cargo install stylua 
" c++
" npm install -g clang-format
" rust
" rustup component add rustfmt
" shell
" go install mvdan.cc/sh/v3/cmd/shfmt@latest
" toml
" cargo install taplo-cli
" yaml
" npm install --save-dev --save-exact prettier

]]
)
