return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
            terraform = { "terraform_fmt" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        }
    },
}
