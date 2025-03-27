-- Set leader key to space
vim.g.mapleader = " "

-- General settings
vim.opt.number = true             -- Show line numbers
vim.opt.relativenumber = true     -- Relative line numbers
vim.opt.tabstop = 4               -- Number of spaces for a tab
vim.opt.shiftwidth = 4            -- Number of spaces for indentation
vim.opt.expandtab = true          -- Use spaces instead of tabs
vim.opt.autoindent = true         -- Auto-indent new lines
vim.opt.smartindent = true        -- Smart indentation
vim.opt.ignorecase = true         -- Case insensitive searching
vim.opt.smartcase = true          -- Case-sensitive if uppercase letters are used
vim.opt.cursorline = true         -- Highlight current line
vim.opt.wrap = true               -- Enable line wrapping
vim.opt.undofile = true           -- Persistent undo
vim.opt.termguicolors = true      -- Enable true color support

-- Enable system clipboard
vim.opt.clipboard:append("unnamedplus")

-- Keybindings
vim.keymap.set('n', 'n', 'nzzzv', { noremap = true, silent = true })
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>a', ':qa<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>x', ':x<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>s', ':mks<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>l', ':source Session.vim<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h', ':noh<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>f', ':Files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', ':Buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>p', ':Prettier<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>|', ':vsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>-', ':split<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>u', ':b#<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', ':NERDTreeRefreshRoot<CR>', { noremap = true, silent = true })

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
  { "morhetz/gruvbox" },
  { "preservim/nerdtree", config = function()
      vim.api.nvim_set_keymap('n', '<leader>e', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>t', ':NERDTreeFind<CR>', { noremap = true, silent = true })
    end
  },
  { "vim-airline/vim-airline" },
  { "junegunn/fzf", build = function()
      vim.fn.system("~/.fzf/install --all")
    end
  },
  { "junegunn/fzf.vim" },
  { "prettier/vim-prettier" },
  { "neovim/nvim-lspconfig", config = function()
      -- Configure Python LSP using Pyright
      require('lspconfig').pyright.setup{}
      require('lspconfig').ts_ls.setup{}
    end
  },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = function()
      require("nvim-treesitter.configs").setup({
          -- Ensure the Python and TypeScript parsers are installed
          ensure_installed = { "python", "typescript" },
          highlight = {
              enable = true, -- false will disable the whole extension
          },
      })
    end
  },
})

vim.g.gruvbox_transparent_bg = 1

vim.opt.clipboard = ""

-- Set theme
vim.cmd("colorscheme gruvbox")
