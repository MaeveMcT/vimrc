local lsp = vim.lsp
local fzf = require("fzf-lua")

require('go').setup()

-- lsp.preset("recommended")

lsp.enable({
	'ts_ls',
	'eslint',
	'lua_ls',
	'rust_analyzer',
	'clangd',
	'gopls',
	'bashls',
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
--[[
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<TAB>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i'}),
	['<S-TAB>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i'}),
	['<CR>'] = cmp.mapping.confirm({ select = true }),
})
--]]

--[[
lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr) 
	local opts = {buffer = bufnr, remap = false}

	--- TODO(reece): 
		-- nmap <leader>qf  <Plug>(coc-fix-current)
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
	vim.keymap.set("n", "gr", function() fzf.lsp_references() end, opts)
	vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
	vim.keymap.set("n", "gy", function() vim.lsp.buf.type_definition() end, opts)
	vim.keymap.set("n", "gs", function() vim.lsp.buf.signature_help() end, opts)
	vim.keymap.set("n", "gl", function() fzf.lsp_workspace_diagnostics({ fzf_opts = {['--layout'] = 'reverse'} }) end, opts)

	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<c-j>", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "<c-k>", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>ac", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
	--- Example of using a command instead of a function
	-- vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)
end)

lsp.set_preferences({
	sign_icons = { }
})
--]]

-- lsp.setup()
