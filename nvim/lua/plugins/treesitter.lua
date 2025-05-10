return
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = function()
		require("nvim-treesitter.configs").setup({
			-- Ensure the Python and TypeScript parsers are installed
			ensure_installed = { "rust", "python", "typescript", "lua", "markdown", "markdown_inline" },
			highlight = {
				enable = true,
			},
		})
	end
}
