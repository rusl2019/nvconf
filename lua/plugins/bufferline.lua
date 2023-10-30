vim.opt.termguicolors = true

local status_buff_ok, bufferline = pcall(require, "bufferline")
if not status_buff_ok then
    return
end

local status_cat_ok, catppuccin = pcall(require, "catppuccin")
if not status_cat_ok then
    return
end

local mocha = require("catppuccin.palettes").get_palette("mocha")

bufferline.setup({
    highlights = require("catppuccin.groups.integrations.bufferline").get({
        styles = { "italic", "bold" },
        custom = {
            all = {
                fill = { bg = "#000000" },
            },
            mocha = {
                background = { fg = mocha.text },
            },
            latte = {
                background = { fg = "#000000" },
            },
        },
    }),
})
