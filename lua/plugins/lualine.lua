local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = "catppuccin",
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "filename", "diagnostics" },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { "filetype" },
        lualine_z = { "progress" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = { "filename" },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {
        "aerial",
        "chadtree",
        "fern",
        "fugitive",
        "fzf",
        "man",
        "mundo",
        "neo-tree",
        "nerdtree",
        "nvim-dap-ui",
        "nvim-tree",
        "quickfix",
        "symbols-outline",
        "toggleterm",
    },
})
