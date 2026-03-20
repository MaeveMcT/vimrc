local fzf = require("fzf-lua")
require('go').setup()

-- Gutter space so diagnostics don't cause layout shifts
vim.opt.signcolumn = 'yes'

-- Rounded borders on all floating windows (replaces the old vim.lsp.handlers approach)
vim.o.winborder = 'rounded'

-- Wire up nvim-cmp capabilities to ALL servers globally
vim.lsp.config('*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- Keymaps on attach (replaces lsp.on_attach)
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP keymaps',
  callback = function(event)
    local opts = { buffer = event.buf, remap = false }

    -- Navigation
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "K",  vim.lsp.buf.hover, opts)

    -- fzf-lua for references and diagnostics (keeping your existing behaviour)
    vim.keymap.set("n", "gr", fzf.lsp_references, opts)
    vim.keymap.set("n", "gl", function()
      fzf.lsp_workspace_diagnostics({ fzf_opts = { ['--layout'] = 'reverse' } })
    end, opts)

    -- Diagnostics navigation
    vim.keymap.set("n", "<c-j>", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<c-k>", vim.diagnostic.goto_prev, opts)

    -- Actions
    vim.keymap.set("n", "<leader>ac", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  end,
})

-- Install servers via mason-lspconfig (replaces lsp.ensure_installed)
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'ts_ls',
    'eslint',
    'lua_ls',
    'rust_analyzer',
    'clangd',
    'gopls',
    'bashls',
    'ruff',
    'pyright'
  },
  -- This handler auto-calls vim.lsp.enable() for each installed server
  handlers = {
    function(server_name)
      vim.lsp.enable(server_name)
    end,
  },
})

vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      check = {
        command = "clippy",
      },
    },
  },
})

-- nvim-cmp completion setup (unchanged in structure, just detached from lsp-zero)
local cmp = require('cmp')
cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  },
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body) -- built-in since nvim 0.10, no luasnip needed
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<TAB>']   = cmp.mapping.select_next_item(),
    ['<S-TAB>'] = cmp.mapping.select_prev_item(),
    ['<CR>']    = cmp.mapping.confirm({ select = true }),
  }),
})
