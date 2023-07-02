local null_ls = require("null-ls")

local cspell_config = {
    config_file_preferred_name = 'cspell.json',
    on_success = function(cspell_config_file_path, action_name)
        if action_name == 'add_to_json' then
            os.execute(
                string.format(
                    "cat %s | jq -S '.words |= sort' | tee %s > /dev/null",
                    cspell_config_file_path,
                    cspell_config_file_path
                )
            )
        end
    end
}

local b = null_ls.builtins

null_ls.setup({
    sources = {
        b.formatting.prettierd,
        b.formatting.fixjson,

        b.diagnostics.tsc,
        --b.diagnostics.cspell.with { config = cspell_config },

        b.hover.dictionary,

        b.code_actions.eslint_d,
        -- b.code_actions.gitsigns,
        -- b.code_actions.gitrebase,
        b.code_actions.cspell.with { config = cspell_config },
    },
    save_after_format = true
})
