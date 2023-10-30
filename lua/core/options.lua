local options = {
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    fileencoding = "utf-8", -- the encoding written to a file
    cursorline = true, -- highlight the current line
    number = true, -- set numbered lines
    relativenumber = true, -- set relative numbered lines
    termguicolors = true, -- Enable 24-bit RGB color in the TUI
    -- Options for insert mode completion
    completeopt = { "menu", "menuone", "noselect" },
    shiftwidth = 4, -- Number of space inserted for indentation
    tabstop = 4, -- Number of space in a tab
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.wo.colorcolumn = "88"
