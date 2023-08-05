require('nvim-treesitter.configs').setup {
    ensure_installed = { "c_sharp", "lua", "css", "diff", "dockerfile", "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
        "html", "http", "json", "markdown", "markdown_inline", "typescript"
    },
    sync_install = false,
    auto_install = true,
    ignore_install = { "javascript" },
    highlight = {
        enable = true,
    },
}
