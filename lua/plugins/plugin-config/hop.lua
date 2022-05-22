-- init.vim
--
-- Use better keys for the bépo keyboard layout and set
-- a balanced distribution of terminal / sequence keys
local hop = require("hop")

hop.setup(
    {
        keys = "etovxqpdygfblzhckisuran",
        jump_on_sole_occurrence = false
    }
)

-- keymap
-- place this in one of your configuration file(s)
vim.keymap.set(
    "n",
    "<leader><leader>f",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
    {}
)
vim.keymap.set(
    "n",
    "<leader><leader>F",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
    {}
)
vim.keymap.set(
    "o",
    "<leader><leader>f",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
    {}
)
vim.keymap.set(
    "o",
    "<leader><leader>F",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
    {}
)
vim.keymap.set(
    "n",
    "<leader><leader>s",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR})<cr>",
    {}
)
vim.keymap.set(
    "o",
    "<leader><leader>s",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, inclusive_jump = true })<cr>",
    {}
)
