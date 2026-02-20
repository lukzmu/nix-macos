return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function(_)
        require("lualine").setup({
            options = {
                theme = "catppuccin",
            },
        })
    end,
}
