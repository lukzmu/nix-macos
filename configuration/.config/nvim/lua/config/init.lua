-- Bootstrap lazy.nvim --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Common Settings --
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"
vim.wo.number = true
vim.g.mouse = 'a'
vim.opt.encoding='utf-8'
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.scrolloff = 7
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.equalalways = true
vim.opt.laststatus = 3

-- Setup lazy.nvim --
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  checker = { enabled = true },
})

-- Other Configurations --
require("config.keymap")
require("config.window")
