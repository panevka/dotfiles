-- Extension installer, NodeJS host for Neovim

return {
	"neoclide/coc.nvim", -- This is the coc.nvim plugin
	branch = "release", -- You can choose other branches, but `release` is most stable
	config = function()
		-- You can add additional configuration for coc.nvim here if needed
		-- For example, to set up the coc extensions
		-- vim.cmd("CocInstall coc-tsserver coc-python coc-eslint")  -- Install extensions (example)
	end,
}
