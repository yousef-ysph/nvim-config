local telescope = require("telescope")

telescope.setup({
	pickers = {
		find_files = {
			hidden = true,
			file_ignore_patterns = { "node_modules/.*", ".git/" },
		},
		live_grep = {
			additional_args = function(opts)
				return { "--hidden" }
			end,
			file_ignore_patterns = { "node_modules/.*", ".git/" },
		},
	},
})
