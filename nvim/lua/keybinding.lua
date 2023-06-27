local N = {}

function N.setup()
    local v = vim

    local opt = { noremap = false, silent = true, nowait = true }

    -- Default
    v.keymap.set('n', '<c-a>', 'ggVG', opt)               -- Select All text in file
    v.keymap.set('', '<esc>', '<cmd>nohlsearch<cr>', opt) -- Cancel highlighting selected text

    v.keymap.set('n', '<space>w', '<C-w>w', opt)          -- Switch window focus

    -- Diagnostic
    v.keymap.set('n', '<space>e', v.diagnostic.open_float, opt) -- Open description for diagnostic in window
    v.keymap.set('n', '<space>q', v.diagnostic.setloclist, opt) -- Open diagnostics list

    v.api.nvim_create_autocmd('LspAttach', {
        group = v.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
            v.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

            local opts = { buffer = ev.buf }

            v.keymap.set('n', 'gD', v.lsp.buf.declaration, opts)
            v.keymap.set('n', 'gd', v.lsp.buf.definition, opts)
            v.keymap.set('n', 'K', v.lsp.buf.hover, opts)
            v.keymap.set('n', 'gi', v.lsp.buf.implementation, opts)
            v.keymap.set('n', '<C-k>', v.lsp.buf.signature_help, opts)
            --v.keymap.set('n', '<space>wa', v.lsp.buf.add_workspace_folder, opts)
            --v.keymap.set('n', '<space>wr', v.lsp.buf.remove_workspace_folder, opts)
            --v.keymap.set('n', '<space>wl', function() print(v.inspect(v.lsp.buf.list_workspace_folders())) end, opts)
            v.keymap.set('n', '<space>D', v.lsp.buf.type_definition, opts)
            v.keymap.set('n', '<space>rn', v.lsp.buf.rename, opts)
            v.keymap.set({ 'n', 'v' }, '<space>ca', v.lsp.buf.code_action, opts)
            v.keymap.set('n', 'gr', v.lsp.buf.references, opts)
            v.keymap.set('n', '<space>f', function() v.lsp.buf.format { async = true } end, opts)
        end,
    })
end

return N
