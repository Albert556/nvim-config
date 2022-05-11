local autopairs = require("nvim-autopairs")

autopairs.setup {
    check_ts = true,
    enable_check_bracket_line = false,
    ts_config = {
        lua = {"string", "source"},
        javascript = {"string", "template_string"},
        java = false
    },
    disable_filetype = {"TelescopePrompt", "spectre_panel"},
    disable_in_macro = false,
    ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
    enable_moveright = true,
    enable_afterquote = true,
    map_c_w = false,
    map_bs = true,
    disable_in_visualblock = false,
    fast_wrap = {
        map = "<M-e>",
        chars = {"{", "[", "(", '"', "'"},
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0, -- Offset from pattern match
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "Search",
        highlight_grey = "Comment"
    }
}

local rule = require "nvim-autopairs.rule"
local ts_conds = require "nvim-autopairs.ts-conds"

autopairs.add_rules {
    rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node {"string", "comment"}),
    rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node {"function"})
}
