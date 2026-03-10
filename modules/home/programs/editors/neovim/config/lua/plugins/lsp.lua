return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = { "pyright", "ruff" },
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
	config = function(_, opts)
		vim.lsp.config("pyright", {
			settings = {
				pyright = {
					disableOrganizeImports = true,
				},
				python = {
					analysis = {
						ignore = { "*" },
					},
				},
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client == nil then
					return
				end

				if client.name == "ruff" then
					client.server_capabilities.hoverProvider = false
				end
			end,
			desc = "Prefer Pyright hover when Ruff and Pyright both attach",
		})

		require("mason-lspconfig").setup(opts)
	end,
}
