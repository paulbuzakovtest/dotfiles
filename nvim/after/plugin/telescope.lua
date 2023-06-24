local statusTelescope, telescope  = pcall(require, 'telescope')
if (not statusTelescope) then return end

local statusBuiltin, builtin = pcall(require, 'telescope.builtin')
if (not statusBuiltin) then return end

telescope.setup {
    pickers = {
        find_files = {
            theme = "dropdown",
        }
    },
    extensions = {
        file_browser = {
            theme = "dropdown",
            hijack_netrw = true,
        },
    },
}

telescope.load_extension "file_browser"

vim.keymap.set('n', 'ff', builtin.find_files)
vim.keymap.set('n', 'fg', builtin.live_grep)
vim.keymap.set('n', 'fb', builtin.buffers)
