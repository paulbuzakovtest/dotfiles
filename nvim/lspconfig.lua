local mlspStatus, mlsp = pcall(require, "mason-lspconfig")
if (not mlspStatus) then return end

local lspStatus, lspconfig = pcall(require, "lspconfig")
if (not lspStatus) then return end

mlsp.setup {
    ensure_installed = {
        "lua_ls", "csharp_ls", "cssls", "html", "tailwindcss", "tsserver"
    },
    automatic_installation = true,
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local servers = { "lua_ls", "csharp_ls", "cssls", "html", "tailwindcss", "tsserver", "jsonls" }

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        capabilities = capabilities,
    }
end
