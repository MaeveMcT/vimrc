-- Where we install the plugins!
return {
  -- Editing utilities
  { "Dimercel/todo-vim" },
  { "ludovicchabant/vim-gutentags" },
  { "machakann/vim-highlightedyank" },
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
  { "tpope/vim-commentary" },
  { "tomtom/tcomment_vim" },
  { "Raimondi/delimitMate" },
  { "vim-scripts/ZoomWin" },

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

  -- Themes
  { "morhetz/gruvbox" },
  { "catppuccin/nvim", name = "catppuccin" },

  -- Language support
  { "tpope/vim-rails" },
  { "tpope/vim-bundler" },
  { "vim-ruby/vim-ruby" },
  { "tweekmonster/gofmt.vim" },
  {
    "ray-x/go.nvim",
    dependencies = { "ray-x/guihua.lua" }, -- recommended by go.nvim
    build = ':lua require("go.install").update_all_sync()',
    ft = { "go", "gomod", "gowork", "gotmpl" },
  },
  { "leafOfTree/vim-svelte-plugin" },
  { "rust-lang/rust.vim" },
  { "octol/vim-cpp-enhanced-highlight" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",           
    build = ":TSUpdate",
  },

  -- LSP (lsp-zero removed per your 0.11 migration)
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
