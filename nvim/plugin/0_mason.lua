local masonStatus, mason = pcall(require, "mason")
if (not masonStatus) then return end

mason.setup()
