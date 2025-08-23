--
-- GitHub integration for code reviews
--
return {
	"pwntester/octo.nvim",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		-- OR 'ibhagwan/fzf-lua',
		-- OR 'folke/snacks.nvim',
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("octo").setup({ enable_builtin = true })
	end,
	keys = {
		{ "<leader>O", "<cmd>Octo<cr>", desc = "Octo" },
	},
}
