-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup({
	-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).

	-- NOTE: Plugins can also be added by using a table,
	-- with the first argument being the link and the following
	-- keys can be used to configure plugin behavior/loading/etc.
	--
	-- Use `opts = {}` to force a plugin to be loaded.

	-- [[Plugins]]
	-- Detect tabstop and shiftwidth automatically
	require("plugins/vim-sleuth"),

	-- Storing directory/custom sessions for next nvim run
	require("plugins/auto-session"),

	-- Neovim plugin for http requests, insomnia like.
	require("plugins/rest"),

	-- VSCode-like side GUI file tree in neovim
	require("plugins/nvim-tree"),

	-- Auto update for imports after rename/move operations with nvim-tree
	require("plugins/lsp/nvim-lsp-file-operations"),

	-- Git UI inside nvim
	require("plugins/lazygit"),

	require("plugins/gitsigns"),

	-- Useful plugin to show you pending keybinds.
	require("plugins/which-key"),

	-- Fuzzy Finder (files, lsp, etc)
	require("plugins/telescope"),

	-- Colorscheme plugins & settings
	require("plugins/colorscheme"),

	-- Highlight todo, notes, etc in comments
	require("plugins/todo-comments"),

	-- Collection of various small independent plugins/modules
	require("plugins/mini"),

	-- Highlight, edit, and navigate code
	require("plugins/treesitter"),

	-- Extension installer, NodeJS host for Neovim
	require("plugins/coc"),

	require("plugins/luarocks"),

	require("plugins/nvim-soil"),

	-- Debug Adapter Protocol client implementation for Neovim
	require("plugins/nvim-dap"),

	-- [[LSP Plugins]]

	-- Lua LSP configuration for Neovim
	require("plugins/lsp/lazydev"),

	-- Data types, classes, methods for Lua Luvit framework
	require("plugins/lsp/luvit-meta"),

	-- Main LSP Configuration
	require("plugins/nvim-lspconfig"),

	-- Java LSP Config
	require("plugins/lsp/nvim-java"),

	-- Autoformat
	require("plugins/lsp/conform"),

	-- Autocompletion
	require("plugins/lsp/nvim-cmp"),

	-- Linting
	require("plugins/lsp/nvim-lint"),

	-- The following comments only work if you have downloaded the kickstart repo, not just copy pasted the
	-- init.lua. If you want these files, they are in the repository, so you can just download them and
	-- place them in the correct locations.
	--
	--  Here are some example plugins that I've included in the Kickstart repository.
	--  Uncomment any of the lines below to enable them (you will need to restart nvim).
	--
	-- require 'kickstart.plugins.debug',
	-- require 'kickstart.plugins.indent_line',
	-- require 'kickstart.plugins.lint',
	-- require 'kickstart.plugins.autopairs',
	-- require 'kickstart.plugins.neo-tree',
	-- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

	-- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart

	-- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
	--    This is the easiest way to modularize your config.
	--
	--  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
	-- { import = 'custom.plugins' },
	--
	-- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
	-- Or use telescope!
	-- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
	-- you can continue same window with `<space>sr` which resumes last telescope search
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
