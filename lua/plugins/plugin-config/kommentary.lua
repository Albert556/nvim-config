
local kommentary = require('kommentary')
local kommentary_config = require('kommentary.config')

kommentary_config.configure_language({"c", "cpp", "go", "lua", "rust"}, {
    prefer_single_line_comments = true,
})

kommentary_config.use_extended_mappings()
