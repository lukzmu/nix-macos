return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        term_colors = true,
        transparent_background = true,
        integrations = {
            cmp = true,
            indent_blankline = {
                enabled = true,
                colored_indent_levels = true,
            },
            mason = true,
            nvimtree = true,
            render_markdown = true,
            telescope = {
                enabled = true,
            },
        }
    },
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin-mocha")
    end,
}
