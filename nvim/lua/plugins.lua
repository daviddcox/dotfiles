return {
	{ "preservim/nerdtree" },
	{ 'nvim-telescope/telescope.nvim', tag = '0.1.8' },
	{
		'rmagatti/auto-session',
		lazy = false,
		---@module "auto-session"
		opts = {
			suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
		}
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function() require('lualine').setup({
			options = { theme = 'onedark' },
		}) end,
	},
	{
		"williamboman/mason.nvim",
		config = true
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "ts_ls", "rust_analyzer" },
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.pyright.setup({})
			lspconfig.ts_ls.setup({})
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
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()

			-- Harpoon Keymaps
			vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
			vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
			vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
			vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
			vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
			vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

		end,
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = function()
		require("nvim-treesitter.configs").setup({
			-- Ensure the Python and TypeScript parsers are installed
			ensure_installed = { "rust", "python", "typescript", "lua", "markdown", "markdown_inline" },
			highlight = {
				enable = true,
			},
		})
	end
},
{
	'MeanderingProgrammer/render-markdown.nvim',
	dependencies = { 'nvim-treesitter/nvim-treesitter' },
	opts = {},
},
{ "prettier/vim-prettier", build = "npm install"},
{
	"rebelot/kanagawa.nvim",
	opts = {
		transparent = true,
	}
},
}
