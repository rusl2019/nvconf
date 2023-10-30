local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
    return
end

vim.cmd("colorscheme catppuccin")

catppuccin.setup({
    integrations = {
        aerial = true,
        cmp = true,
        markdown = true,
        mason = true,
        nvimtree = true,
        treesitter = true,
        treesitter_context = false,
        ts_rainbow = true,

        -- Special integrations, see https://github.com/catppuccin/nvim#special-integrations
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
        },
    },
})
