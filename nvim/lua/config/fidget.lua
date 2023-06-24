local M = {}

function M.setup()
    local status, plugin = pcall(require, 'fidget')
    if (not status) then return end
    plugin.setup{}
end

return M
