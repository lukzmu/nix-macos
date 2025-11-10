local vim = vim
local Plug = vim.fn['plug#']

-- Common --
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

vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show diagnostic" })

vim.api.nvim_create_autocmd("VimResized", {
  callback = function()
    vim.cmd("wincmd =")
  end,
})

-- Plugins --
vim.call('plug#begin')
Plug('nvim-tree/nvim-tree.lua')
Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug('neovim/nvim-lspconfig')
Plug('mason-org/mason.nvim')
Plug('mason-org/mason-lspconfig.nvim')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('catppuccin/nvim', {['as'] = 'catppuccin' })
Plug('MeanderingProgrammer/render-markdown.nvim')
vim.call('plug#end')

-- Theme --
require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = true,
})
vim.cmd.colorscheme "catppuccin"

-- Mason --
require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "pyright" },
}
local cmp = require("cmp")
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  },
})


-- Navigation Tree --
require('nvim-tree').setup()

-- Status Bar --
require('lualine').setup()
vim.opt.laststatus = 3
