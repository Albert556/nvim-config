-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
local nvim_tree = require("nvim-tree")

nvim_tree.setup {
    auto_reload_on_write = true,
    disable_netrw = true,
    hijack_cursor = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup = false,
    ignore_ft_on_setup = {"dashboard"},
    open_on_setup = false,
    open_on_setup_file = false,
    open_on_tab = false,
    sort_by = "name",
    update_cwd = false,
    view = {
        width = 30,
        height = 30,
        side = "left",
        preserve_window_proportions = false,
        mappings = {
            custom_only = false,
            list = {
                {key = {"l", "<CR>", "o"}, action = "edit"},
                {key = "h", action = "close_node"},
                {key = "v", action = "vsplit"},
                {key = "O", action = "cd"}
            }
        },
        number = false,
        relativenumber = false,
        signcolumn = "yes"
    },
    renderer = {
        indent_markers = {
            enable = false,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  "
            }
        },
        icons = {
            webdev_colors = true
        }
    },
    hijack_directories = {
        enable = true,
        auto_open = true
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = ""
        }
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {}
    },
    system_open = {
        cmd = nil,
        args = {}
    },
    filters = {
        dotfiles = false,
        custom = {},
        exclude = {}
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500
    },
    trash = {
        cmd = "trash",
        require_confirm = true
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false
        },
        open_file = {
            quit_on_open = false,
            resize_window = true,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = {"notify", "packer", "qf", "diff", "fugitive", "fugitiveblame"},
                    buftype = {"nofile", "terminal", "help"}
                }
            }
        }
    },
    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            diagnostics = false,
            git = false,
            profile = false
        }
    }
}
