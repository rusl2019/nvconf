local status_msn_ok, mason = pcall(require, "mason")
if not status_msn_ok then
    return
end

local status_lsp_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not status_lsp_ok then
    return
end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

mason_lsp.setup({
    ensure_installed = {
        "lua_ls",
        "bashls",
        "pyright",
        "fortls",
        "texlab",
    },
})
