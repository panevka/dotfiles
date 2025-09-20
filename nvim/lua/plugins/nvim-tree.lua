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
		require("nvim-tree").setup({
			view = { adaptive_size = true },
		})

		local function open_nvim_tree(data)
			local api = require("nvim-tree.api")

			-- buffer is a real file on the disk
			local real_file = vim.fn.filereadable(data.file) == 1

			-- buffer is a [No Name]
			local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

			if not real_file and not no_name then
				return
			end

			if api.tree.is_visible() then
				api.tree.find_file()
				return
			else
				api.tree.open({ focus = false, find_file = true })
				return
			end
		end

		vim.api.nvim_create_autocmd({ "BufEnter" }, { callback = open_nvim_tree })
	end,

	vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true, noremap = true }),
}
