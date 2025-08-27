--
-- VSCode-like side GUI file tree in neovim
--
return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({})
	end,

	vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true, noremap = true }),
}
