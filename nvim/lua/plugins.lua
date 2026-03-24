-- Where we install the plugins!
return {
  -- Editing utilities
  { "Dimercel/todo-vim" },
  { "machakann/vim-highlightedyank" },
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
  { "Raimondi/delimitMate" },


  -- Git
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" },

  -- File navigation
  { "airblade/vim-rooter" },
  { "scrooloose/nerdtree" },
  { "majutsushi/tagbar" },
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- FZF
  {
    "junegunn/fzf",
    build = function() vim.fn["fzf#install"]() end,
  },
  { "junegunn/fzf.vim" },
  { "ibhagwan/fzf-lua", branch = "main" },

  { "catppuccin/nvim", name = "catppuccin" },

  -- Language support
  { "tpope/vim-rails" },
  { "tpope/vim-bundler" },
  { "vim-ruby/vim-ruby" },
  { "rust-lang/rust.vim" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
  },

  -- LSP
  { "neovim/nvim-lspconfig" },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
  },
  { "williamboman/mason-lspconfig.nvim" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },

  -- Markdown preview (requires node + yarn, run :call mkdp#util#install() after)
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
    ft = { "markdown" },       -- only loads for markdown files
  },

}
