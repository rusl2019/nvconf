local options = {
	clipboard = "unnamedplus",	-- allows neovim to access the system clipboard
	fileencoding = "utf-8",		-- the encoding written to a file
	cursorline = true,		-- highlight the current line
	number = true,			-- set numbered lines
	relativenumber = true,		-- set relative numbered lines
	termguicolors = true,
	completeopt= { "menu", "menuone", "noselect"},
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do 
	vim.opt[k] = v
end
