return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'catppuccin' },
    config = function(_)
        require("lualine").setup({
            options = {
                theme = "catppuccin-mocha",
            },
        })
    end,
}
