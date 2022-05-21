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
