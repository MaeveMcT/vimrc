local fzf = require("fzf-lua")
vim.keymap.set('n', '<CR>', fzf.files, {})
vim.keymap.set('n', '<C-n>', fzf.live_grep, {})
vim.keymap.set('n', '<C-l>', fzf.buffers, {})

fzf.setup {
	actions = {
		files = {
			-- providers that inherit these actions:
			--   files, git_files, git_status, grep, lsp
			--   oldfiles, quickfix, loclist, tags, btags
			--   args
			-- default action opens a single selection
			-- or sends multiple selection to quickfix
			-- replace the default action with the below
			-- to open all files whether single or multiple
			-- ["default"]     = actions.file_edit,
			["default"]     = fzf.actions.file_edit_or_qf,
			["ctrl-z"]      = fzf.actions.file_split,
			["ctrl-x"]      = fzf.actions.file_vsplit,
			["ctrl-t"]        = fzf.actions.file_tabedit,
			["alt-q"]         = fzf.actions.file_sel_to_qf,
		},
	},
}
