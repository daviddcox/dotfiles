return {
	{
		"williamboman/mason.nvim",
		config = true
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "ts_ls", "rust_analyzer", "omnisharp" },
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local mason_registry = require("mason-registry")

			lspconfig.pyright.setup({})
			lspconfig.ts_ls.setup({})

			local omnisharp = mason_registry.get_package("omnisharp")
			local omnisharp_path = omnisharp:get_install_path() .. "/OmniSharp"
			lspconfig.omnisharp.setup({
				cmd = { omnisharp_path },
				enable_roslyn_analyzers = true,
				organize_imports_on_format = true,
				enable_import_completion = true,
			})

			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						}
					}
				}
			})

			lspconfig.rust_analyzer.setup({
				settings = {
					["rust-analyzer"] = {
						cargo = { allFeatures = true },
						check = { command = "clippy" },
					},
				},
			})
		end
	},
}

