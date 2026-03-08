local ts = require('nvim-treesitter')

-- 1. Install all your parsers (replaces ensure_installed)
local parsers = {
  "c", "lua", "vim", "vimdoc", "query",
  "javascript", "typescript", "rust", "ruby", "go", "gotmpl",
}

for _, parser in ipairs(parsers) do
  ts.install(parser)
end

-- 2. Enable highlighting via FileType autocmd (replaces highlight = { enable = true })
--    Build filetype patterns from parser names, accounting for name mismatches
local patterns = {}
for _, parser in ipairs(parsers) do
  local filetypes = vim.treesitter.language.get_filetypes(parser)
  for _, ft in ipairs(filetypes) do
    table.insert(patterns, ft)
  end
end

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('treesitter_highlight', { clear = true }),
  pattern = patterns,
  callback = function(args)
    -- Skip gitcommit (your old disable = {"gitcommit"})
    if vim.bo[args.buf].filetype == 'gitcommit' then return end
    vim.treesitter.start(args.buf)
  end,
})

-- 3. Register gotmpl custom parser (replaces get_parser_configs())
--    Must be done inside TSUpdate autocmd on the new main branch
vim.api.nvim_create_autocmd('User', {
  pattern = 'TSUpdate',
  callback = function()
    require('nvim-treesitter.parsers').gotmpl = {
      install_info = {
        url   = "https://github.com/ngalaiko/tree-sitter-go-template",
        files = { "src/parser.c" },
      },
    }
  end,
})

-- Register gotmpl filetype associations (replaces used_by)
vim.treesitter.language.register('gotmpl', {
  'gotmpl', 'gohtmltmpl', 'gotexttmpl', 'yaml', 'tmpl'
})
