-- Need to set the leader key before lazy.nvim loads
vim.g.mapleader = " "

require("config.lazy")

vim.cmd.colorscheme("catppuccin") -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

vim.opt.compatible = false
vim.opt.path:append("**")

-- Make j and k move to the next row, not file line
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- Centre the screen after jumping half page
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-o>', '<C-o>zz')
vim.keymap.set('n', '<C-i>', '<C-i>zz')

-- Centre screen after jumping to search result. Need the 'zv' at the end to:
--   1. Open folds (not that they get used)
--   2. N wouldn't go backwards when searching forwards, and vice versa. No
--      idea why it is fixed by this
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('n', 'gf', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
vim.keymap.set('n', '<leader>f', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
vim.keymap.set('n', 'mf', ':lua require("harpoon.mark").add_file()<CR>')
-- :lua require("harpoon.ui").nav_next()                   -- navigates to next mark
-- :lua require("harpoon.ui").nav_prev()                   -- navigates to previous mark

vim.cmd('syntax on')

vim.opt.relativenumber = true

vim.opt.undodir = os.getenv("HOME") .. "/.vimdid"
vim.opt.undofile = true

vim.opt.clipboard = "unnamedplus"
vim.opt.number = true

vim.opt.shiftround = true

-- Change tabs to 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.showcmd = true
vim.opt.copyindent = true

vim.opt.smarttab = true

-- Search stuff
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Saves the file (handling the permission-denied error)
vim.cmd('cnoremap w!! w !sudo tee % >/dev/null')
-- Remove search highlights
vim.keymap.set('n', '<leader><CR>', ':noh<CR>', { silent = true })

-- remap ii to exit modes
vim.keymap.set('i', 'ii', '<Esc>')
vim.keymap.set('i', 'jk', '<Esc>')

vim.cmd('filetype off')

-- NOTE: If using a plugin manager like lazy.nvim or packer.nvim,
-- replace the Vundle rtp line below with your plugin manager setup.
-- vim.opt.rtp:prepend("~/.vim/bundle/Vundle.vim")

vim.cmd('filetype plugin indent on')

-- NERDTree
vim.g.NERDTreeWinPos = 'right'
vim.keymap.set('n', '<F5>', ':NERDTreeToggle<CR>')

-- FZF
vim.env.FZF_DEFAULT_COMMAND = 'rg --files --hidden'
vim.keymap.set('n', '<C-m>', ':Files<CR>')
vim.keymap.set('n', '<C-n>', ':Rg<CR>')
vim.keymap.set('n', '<C-l>', ':Buffer<CR>')
vim.g.fzf_action = { ['ctrl-x'] = 'vsplit', ['ctrl-c'] = 'split' }

vim.keymap.set('n', '<leader><leader>', ':b#<CR>')

-- Rust
vim.keymap.set('n', '<F9>', ':!cargo run<CR>')
vim.keymap.set('n', '<leader>p', ':!cargo run<CR>')
vim.keymap.set('n', '<F8>', ':!cargo build<CR>')
vim.keymap.set('n', '<F7>', ':!cargo test<CR>')
vim.keymap.set('n', 'gp', ':!cargo run<CR>', { silent = true })
vim.g.rustfmt_autosave = 1

-- Tagbar
vim.g.tagbar_left = 1
vim.keymap.set('n', '<F3>', ':TagbarToggle<CR>')
vim.keymap.set('n', '<F2>', ':TagbarOpen fcj<CR>')

vim.opt.background = "dark"

-- Todo-vim
vim.keymap.set('n', '<F6>', ':TODOToggle<CR>')

vim.keymap.set('n', 'Q', ':q<CR>')

-- Completion
-- Better display for messages
vim.opt.cmdheight = 2
vim.opt.signcolumn = "yes"

-- Mapping for save file
-- vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<c-s>', ':w<CR>')
vim.keymap.set('v', '<c-s>', '<Esc>:w<CR>gv')
vim.keymap.set('i', '<c-s>', '<Esc>:w<CR>')

-- Vim fugitive
-- Vertical diff splits
vim.opt.diffopt:append("vertical")
vim.keymap.set('n', '<leader>gs', ':Git<CR>')
vim.opt.splitbelow = true
vim.opt.splitright = true

-- For Python 3 plugins:
-- 1. Make sure Python 3.4+ is available in your $PATH.
-- 2. Install the module (try "python" if "python3" is missing): >
--    python3 -m pip install --user --upgrade pynvim

