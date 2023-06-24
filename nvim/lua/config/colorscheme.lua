local M = {}

function M.setup()
    local v = vim

    v.g.solarized_italic_comments = true
    v.g.solarized_italic_keywords = true
    v.g.solarized_italic_functions = true
    v.g.solarized_italic_variables = false
    v.g.solarized_contrast = true
    v.g.solarized_borders = false
    v.g.solarized_disable_background = false

    require('solarized').set()
end

return M
