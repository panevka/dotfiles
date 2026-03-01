-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
--
--
vim.opt.relativenumber = true -- relative line numbers
vim.opt.wrap = true           -- wrap lines

lvim.plugins = {
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
}

local lspconfig = require('lspconfig')
local lombok = vim.fn.stdpath('data') .. '/mason/packages/jdtls/lombok.jar'

lspconfig.jdtls.setup { cmd = { "jdtls", "--jvm-arg=-javaagent:" .. lombok } }

vim.filetype.add({
  pattern = {
    [".env.*"] = "dotenv",
  },
})
