vim.opt.relativenumber = true
vim.opt.termguicolors = true

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
        builtin.current_buffer_fuzzy_find({default_text = text})
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
vim.cmd [[colorscheme gruvbox]]
