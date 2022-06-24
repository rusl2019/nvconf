local status_ok, tokyonight = pcall(require, "tokyonight")
if not status_ok then
	return
end

vim.g.tokyonight_style = "night" -- option: day, night, and storm
vim.cmd[[colorscheme tokyonight]]
