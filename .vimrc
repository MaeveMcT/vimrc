" Needed for nvim (nvim path .config/nvim/init.vim )
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

let mapleader=" "
set nocompatible
set path+=**

" Make j and k move to the next row, not file line
nnoremap j gj
nnoremap k gk

" Centre the screen after jumping half page
nnoremap <C-d> <C-d>zz 
nnoremap <C-u> <C-u>zz 
nnoremap <C-o> <C-o>zz 
nnoremap <C-i> <C-i>zz 

" Centre screen after jumping to search result Need the 'zv' at the end to:
"	1. Open folds (not that they get used)
"	2. N wouldn't go backwards when searching forwards, and vice versa. No
"	   idea why it is fixed by this
nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap gf :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>f :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap mf :lua require("harpoon.mark").add_file()<CR>
" :lua require("harpoon.ui").nav_next()                   -- navigates to next mark
" :lua require("harpoon.ui").nav_prev()                   -- navigates to previous mark

syntax on

set relativenumber

set undodir=~/.vimdid
set undofile

"color desert

set clipboard=unnamedplus
set number

set shiftround

"Change tabs to 4 spaces
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab 
set showcmd
set copyindent

set smarttab

"Search stuff
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase

" Saves the file (handling the permission-denied error)
cnoremap w!! w !sudo tee % >/dev/null
"Remove search highlights
noremap <silent> <leader><cr> :noh<cr>

"remap ii to exit modes
imap ii <Esc>
imap jk <Esc>

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

filetype plugin indent on

"NERDTree
let g:NERDTreeWinPos = 'right'
map <F5> :NERDTreeToggle<CR>

"FZF
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
map <C-m> :Files<CR>
map <C-n> :Rg<CR>
map <C-l> :Buffer<CR>
let g:fzf_action = { 'ctrl-x': 'vsplit', 'ctrl-c': 'split' }

map <leader><leader> :b#<CR>

"Rust
map <F9> :!cargo run<CR>
map <leader>p :!cargo run<CR>
map <F8> :!cargo build<CR>
map <F7> :!cargo test<CR>
map <silent> gp :!cargo run<CR>
let g:rustfmt_autosave = 1

"Tagbar
let g:tagbar_left = 1
let g:gutentags_enabled = 0
nmap <F3> :TagbarToggle<CR>
nmap <F2> :TagbarOpen fcj<CR>

set background=dark

"Todo-vim
nmap <F6> :TODOToggle<CR>

:nnoremap Q :q<CR>

" Fixes coc solargraph ECONNREFUSED 
" =========== COC Config (Deprecated - using LSP now) ===========
" let g:coc_node_args = ['--dns-result-order=ipv4first']
" 
" "nvim coc config
" "From https://github.com/neoclide/coc.nvim#example-vim-configuration
"  "Use tab for trigger completion with characters ahead and navigate.
"  "NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
"  "other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" 
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
" 
" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()
" 
" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" 
" " Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>
" 
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction
" 
" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" " position. Coc only does snippet and additional edit on confirm.
" " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
" if exists('*complete_info')
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif
" " Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)
"
" Use `leader[` and `leader]` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location
"list.
" nmap <c-k> <Plug>(coc-diagnostic-prev)
" nmap <c-j> <Plug>(coc-diagnostic-next)

" Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)


"Go
"autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
" 
" =========== END OF COC Config (Deprecated - using LSP now) ===========

" Completion
" Better display for messages
set cmdheight=2
set signcolumn=yes

"Mapping for save file
"map <leader>w :w<CR>
nmap <c-s> :w<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>

"Vim fugitive
"Vertical diff splits
set diffopt+=vertical
nmap <leader>gs  :Git<CR>
set splitbelow
set splitright

"For Python 3 plugins:
"1. Make sure Python 3.4+ is available in your $PATH.
"2. Install the module (try "python" if "python3" is missing): >
"   python3 -m pip install --user --upgrade pynvim

"Clangd-format on save (NEEDS PYTHON, SEE ABOVE)
"FOR MAC: brew install clang-format
"FOR MAC: brew install llvm
function! Formatonsave()
  let l:formatdiff = 1
  py3f /usr/share/clang/clang-format.py
  "FOR MAC: py3f /opt/homebrew/Cellar/llvm/13.0.1_1/share/clang/clang-format.py
endfunction
" autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()


 " For golang tmpl tree sitter support - https://github.com/ngalaiko/tree-sitter-go-template
augroup filetypedetect
autocmd BufNewFile,BufRead *.tmpl, if search('{{.\+}}', 'nw') | setlocal filetype=gotmpl | endif
augroup END
