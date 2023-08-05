local ntStatus, nvimtree = pcall(require, 'nvim-tree')
if (not ntStatus) then return end

nvimtree.setup()

vim.keymap.set("n", "fe", function()
    nvimtree.setup()
    return require("nvim-tree.api").tree.toggle({ find_file = true })
end,
{ silent = true })
