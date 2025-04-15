-- Set leader key to space
vim.g.mapleader = " "

-- General settings
vim.opt.number = true             -- Show line numbers
vim.opt.relativenumber = true     -- Relative line numbers
vim.opt.tabstop = 2               -- Number of spaces for a tab
vim.opt.shiftwidth = 2            -- Number of spaces for indentation
vim.opt.autoindent = true         -- Auto-indent new lines
vim.opt.smartindent = true        -- Smart indentation
vim.opt.ignorecase = true         -- Case insensitive searching
vim.opt.smartcase = true          -- Case-sensitive if uppercase letters are used
vim.opt.cursorline = true         -- Highlight current line
vim.opt.wrap = true               -- Enable line wrapping
vim.opt.undofile = true           -- Persistent undo
vim.opt.termguicolors = true      -- Enable true color support
vim.opt.path:append("**")

-- Enable system clipboard
vim.opt.clipboard:append("unnamedplus")

-- Keybindings
vim.keymap.set('n', 'n', 'nzzzv', { noremap = true, silent = true })
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>x', ':x<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h', ':noh<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>|', ':vsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>-', ':split<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>u', ':b#<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tr', ':NERDTreeRefreshRoot<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>te', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tt', ':NERDTreeFind<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cp', ':cprev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cn', ':cnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>os', ':Obsession<CR>', { noremap = true, silent = true })  -- start
vim.api.nvim_set_keymap('n', '<leader>ox', ':Obsession!<CR>', { noremap = true, silent = true })  -- stop
vim.api.nvim_set_keymap('n', '<leader>pf', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope git_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>pb', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>pe',
function() require('telescope.builtin').diagnostics({ bufnr = 0 }) end,
  { desc = "Telescope buffer diagnostics" }
)
vim.keymap.set('n', '<leader>ps',
function()
  require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
end, { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', '<leader>s', [[:lua SaveSession()<CR>]], { noremap = true, silent = true })
function SaveSession()
  vim.fn.jobstart("ctags -R -L <(git ls-files)", {
    stdout_buffered = true,
    stderr_buffered = true,
    shell = true,
  })
  vim.cmd("mks!")
end

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.json", "*.css", "*.html" },
  command = "Prettier",
})

-- Plugin management using lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
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
	{
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {},
	},
	{ "prettier/vim-prettier", build = "npm install"},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {}
	}
})

vim.opt.clipboard = ""

-- Set theme
vim.cmd("colorscheme tokyonight-night")
