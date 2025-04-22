return {
  { "preservim/nerdtree" },
	{ 'nvim-telescope/telescope.nvim', tag = '0.1.8' },
	{ "tpope/vim-obsession" },
	{ "vim-airline/vim-airline" },
	{ "junegunn/fzf.vim" },
	{
    "williamboman/mason.nvim",
    config = true
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "ts_ls" },
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
    end
  },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = function()
      require("nvim-treesitter.configs").setup({
          -- Ensure the Python and TypeScript parsers are installed
          ensure_installed = { "python", "typescript", "lua", "markdown", "markdown_inline" },
          highlight = {
              enable = true,
          },
      })
    end
  },
	{ "prettier/vim-prettier", build = "npm install"},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			styles = {
				 sidebars = "transparent",
				 floats = "transparent",
			}
		}
	}
}
