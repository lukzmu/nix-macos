return {
    "nvim-treesitter/nvim-treesitter",
    -- `master` is frozen upstream; keep future updates on `main`.
    branch = "main",
    config = function()
        require("config.treesitter").patch_query_directives()
    end,
}
