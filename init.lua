vim.loader.enable()

vim.api.nvim_exec(
    [[
        let g:loaded_ruby_provider = 0 
	    let g:loaded_perl_provider = 0
    ]],
    true
)

require("core")
require("plugins")
