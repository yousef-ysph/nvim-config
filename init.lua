vim.opt.termguicolors = true
vim.cmd("set nu rnu")

local function get_visual_selections()
    vim.cmd('noau normal! "vy"')
    return vim.fn.getreg("v")
end

require("packer-plugins")
local builtin = require("telescope.builtin")
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize -2<CR>", {})
vim.api.nvim_set_keymap("n", "<C-Down>", ":resize +2<CR>", {})
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize -2<CR>", {})
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize +2<CR>", {})

vim.keymap.set("n", "ff", builtin.find_files, {})
vim.keymap.set("n", "fg", builtin.live_grep, {})
vim.keymap.set(
    "v",
    "fg",
    function()
        local text = get_visual_selections()
        builtin.live_grep({default_text = text})
    end,
    {noremap = true, silent = true}
)

local escape_lua_pattern
do
    local matches = {
        ["^"] = "%^",
        ["$"] = "%$",
        ["("] = "%(",
        [")"] = "%)",
        ["%"] = "%%",
        ["."] = "%.",
        ["["] = "%[",
        ["]"] = "%]",
        ["*"] = "%*",
        ["+"] = "%+",
        ["-"] = "%-",
        ["?"] = "%?"
    }

    escape_lua_pattern = function(s)
        return (s:gsub(".", matches))
    end
end

vim.keymap.set(
    "n",
    "<leader>cf",
    function()
        local linenum = vim.api.nvim_win_get_cursor(0)[1]
        local relative_filepath =
            string.gsub(vim.api.nvim_buf_get_name(0), escape_lua_pattern(vim.api.nvim_command_output("pw")) .. "/", "")
        vim.cmd('let @"="' .. relative_filepath .. ":" .. linenum .. '"')
        vim.cmd('let @+="' .. relative_filepath .. ":" .. linenum .. '"')
        vim.api.nvim_notify("Copied filename to clipboard", 0, {})
    end,
    {noremap = true, silent = true}
)

vim.keymap.set("n", "fb", builtin.buffers, {})
vim.keymap.set("n", "fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {desc = "Find Symbols"})
vim.keymap.set("n", "<leader>fi", "<cmd>AdvancedGitSearch<CR>", {desc = "AdvancedGitSearch"})
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {desc = "Find Old Files"})
vim.keymap.set("n", "<leader>fw", builtin.grep_string, {desc = "Find Word under Cursor"})
vim.keymap.set("n", "<leader>gc", builtin.git_commits, {desc = "Search Git Commits"})
vim.keymap.set("n", "<leader>gb", builtin.git_bcommits, {desc = "Search Git Commits for Buffer"})
vim.keymap.set("n", "<leader>fk", builtin.keymaps, {desc = "Find Keymaps"})
vim.keymap.set("n", "<C-h>", vim.cmd.UndotreeToggle)

vim.api.nvim_set_keymap("n", "<C-t>", ":tabnew <CR>", {})
vim.api.nvim_set_keymap("n", "<C-w>", ":tabclose <CR>", {})
vim.api.nvim_set_keymap("n", "<C-a>", ":tabnext <CR>", {})
vim.api.nvim_set_keymap("n", "<C-q>", ":tabprevious <CR>", {})
vim.api.nvim_set_keymap("v", "c", '"+y', {})
vim.api.nvim_set_keymap("n", "<leader>f", ":Neoformat | update <CR>", {})
local colorScheme = "catppuccin-mocha"
vim.cmd("colorscheme " .. colorScheme)
vim.cmd [[
	highlight Normal guibg=none
	highlight NonText guibg=none
	highlight Normal ctermbg=none
	highlight NonText ctermbg=none
	highlight NormalNC guibg=NONE  
	highlight SignColumn guibg=NONE 
	highlight TelescopeNormal guibg=NONE
	highlight TelescopeBorder guibg=NONE
	highlight TelescopePromptNormal guibg=NONE
	highlight TelescopePromptBorder guibg=NONE
	highlight TelescopeResultsNormal guibg=NONE
	highlight TelescopeResultsBorder guibg=NONE
]]
local isTransparent = true

local toggleTransparent = function()
    if isTransparent then
        vim.cmd("colorscheme " .. colorScheme)
    else
        vim.cmd [[
			highlight Normal guibg=none
			highlight NonText guibg=none
			highlight Normal ctermbg=none
			highlight NonText ctermbg=none
			highlight NormalNC guibg=NONE  
			highlight SignColumn guibg=NONE 
			highlight TelescopeNormal guibg=NONE
			highlight TelescopeBorder guibg=NONE
			highlight TelescopePromptNormal guibg=NONE
			highlight TelescopePromptBorder guibg=NONE
			highlight TelescopeResultsNormal guibg=NONE
			highlight TelescopeResultsBorder guibg=NONE
		]]
    end
    isTransparent = not isTransparent
end

vim.api.nvim_create_user_command(
    "ToggleTransparent", -- string
    toggleTransparent,
    {}
)
