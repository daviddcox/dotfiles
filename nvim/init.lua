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

-- Helper Functions
function GrepSearch()
	require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
end

function ErrorSearch()
	require('telescope.builtin').diagnostics({ bufnr = 0 })
end

function GenTags()
  vim.fn.jobstart("ctags -R -L <(git ls-files)", {
    stdout_buffered = true,
    stderr_buffered = true,
    shell = true,
  })
end

-- Set leader key to space
vim.g.mapleader = " "

-- Keybindings
vim.keymap.set('n', 'n', 'nzzzv', { noremap = true, silent = true })
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>x', ':x<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>h', ':noh<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>|', ':vsplit<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>-', ':split<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>u', ':b#<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tr', ':NERDTreeRefreshRoot<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>te', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tt', ':NERDTreeFind<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cp', ':cprev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cn', ':cnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>os', ':Obsession<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ox', ':Obsession!<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>pf', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-p>', ':Telescope git_files<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>pb', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>pe', ErrorSearch, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ps', GrepSearch, { noremap = true, silent = true })

-- Prettier on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.json", "*.css", "*.html" },
  command = "Prettier",
})

-- Include lazy config
require("config.lazy")

-- Set theme
vim.cmd("colorscheme tokyonight-night")
