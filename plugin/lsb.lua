local lsp = require("lsp-zero").preset({})
vim.cmd [[ autocmd BufRead,BufNewFile *.hbs set filetype=html ]]
vim.cmd [[ autocmd BufRead,BufNewFile *.mustache set filetype=html ]]

-- When you don't have mason.nvim installed
-- You'll need to list the servers installed in your system
lsp.preset("recommended")

-- (Optional) Configure lua language server for neovim
--
lsp.on_attach(
    function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp.default_keymaps({buffer = bufnr})
    end
)

lsp.setup_servers({"tsserver", "eslint", "intelephense", "pyright"})

lsp.setup({
  servers = {
    svelte = {
      filetypes = { "svelte" },
      settings = {
        svelte = {
          plugin = {
            svelteCheck = true,
          },
        },
      },
    },
  },
})

vim.diagnostic.config(
    {
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = false,
        float = true
    }
)
