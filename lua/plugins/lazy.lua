local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  require("plugins.comment"),

  require("plugins.flash"),

  require("plugins.gitsigns"),

  require("plugins.indent-blankline"),

  require("plugins.lualine"),

  require("plugins.neo-tree"),

  require("plugins.nvim-autopairs"),

  require("plugins.nvim-surround"),

  require("plugins.telescope"),

  require("plugins.theme"),

  require("plugins.todo-comments"),

  require("plugins.trouble"),

  require("plugins.which-key"),

}, {
	{
		ui = {
			icons = {
				cmd = "⌘",
				config = "🛠",
				event = "📅",
				ft = "📂",
				init = "⚙",
				keys = "🗝",
				plugin = "🔌",
				runtime = "💻",
				source = "📄",
				start = "🚀",
				task = "📌",
				lazy = "💤 ",
			},
		},
	},
})


