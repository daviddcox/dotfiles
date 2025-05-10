-- Set Session Opts
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

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
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<C-f>', 'gg=G\'\'')
vim.keymap.set('n', '<leader>x', ':x<CR>')
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>h', ':noh<CR>')
vim.keymap.set('n', '<leader>|', ':vsplit<CR>')
vim.keymap.set('n', '<leader>-', ':split<CR>')
vim.keymap.set('n', '<leader>u', ':b#<CR>')
vim.keymap.set('n', '<leader>tr', ':NERDTreeRefreshRoot<CR>')
vim.keymap.set('n', '<leader>te', ':NERDTreeToggle<CR>')
vim.keymap.set('n', '<leader>tt', ':NERDTreeFind<CR>')
vim.keymap.set('n', '<leader>cp', ':cprev<CR>')
vim.keymap.set('n', '<leader>cn', ':cnext<CR>')
vim.keymap.set('n', '<leader>os', ':SessionToggleAutoSave<CR>')
vim.keymap.set('n', '<leader>om', ':SessionSearch<CR>')
vim.keymap.set('n', '<leader>pf', ':Telescope find_files<CR>')
vim.keymap.set('n', '<C-p>', ':Telescope git_files<CR>')
vim.keymap.set('n', '<leader>pb', ':Telescope buffers<CR>')
vim.keymap.set('n', '<leader>se', ':lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '<leader>pe', function()
	require('telescope.builtin').diagnostics({
		bufnr = 0,
		layout_strategy = "vertical",
		layout_config = {
			prompt_position = "bottom", -- stays at bottom
			preview_cutoff = 0, -- always show preview
			preview_height = 0.6, -- preview takes ~60% of height
			height = 0.9, -- total height of telescope window
			width = 0.9,
		}
	})
end)
vim.keymap.set('n', '<leader>ps', function()
	require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('v', '<leader>sl', function()
  -- Run each command in order
  vim.cmd("'<,'>s/^/\\=len(getline('.'))/")
  vim.cmd("normal! gv")
  vim.cmd("'<,'>sort n")
  vim.cmd("'<,'>s/\\d*//")
end, { desc = "Sort lines by length" })

-- Prettier on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.json", "*.css", "*.html" },
	command = "Prettier",
})

-- Include lazy config
require("config.lazy")

-- Minimal diagnostics display: underline only, no inline text
vim.diagnostic.config({
  virtual_text = false,  -- Don't show inline diagnostic messages
	signs = false,
  underline = true,      -- Show colored underlines for errors/warnings
  update_in_insert = false,
  severity_sort = true,
})
-- Set theme
vim.cmd("colorscheme kanagawa")

-- Set colored underlines for each severity
vim.cmd([[
  highlight DiagnosticUnderlineError gui=underline guisp=Red
  highlight DiagnosticUnderlineWarn  gui=underline guisp=Yellow
  highlight DiagnosticUnderlineInfo  gui=underline guisp=Blue
  highlight DiagnosticUnderlineHint  gui=underline guisp=Green
]])

