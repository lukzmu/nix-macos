return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'github-theme' },
    config = function(_)
        require("lualine").setup({
            options = {
                theme = "github_dark_default",
            },
        })
    end,
}
