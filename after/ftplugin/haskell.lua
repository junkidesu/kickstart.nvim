-- ~/.config/nvim/after/ftplugin/haskell.lua
local ht = require('haskell-tools')
local bufnr = vim.api.nvim_get_current_buf()

local function opts_with_desc(desc)
  desc = desc or ""

  local opts = { noremap = true, silent = true, buffer = bufnr, }

  opts.desc = desc

  return opts
end

local opts = opts_with_desc("")


ht.lsp.start(bufnr)

-- haskell-language-server relies heavily on codeLenses,
-- so auto-refresh (see advanced configuration) is enabled by default
vim.keymap.set('n', '<space>cl', vim.lsp.codelens.run, opts)
-- Hoogle search for the type signature of the definition under the cursor
vim.keymap.set('n', '<space>hs', ht.hoogle.hoogle_signature, opts)
-- Evaluate all code snippets
vim.keymap.set('n', '<space>ea', ht.lsp.buf_eval_all, opts)
-- Toggle a GHCi repl for the current package
vim.keymap.set('n', '<leader>rr', ht.repl.toggle, opts_with_desc("Start GHCi repl for current package"))
-- Toggle a GHCi repl for the current buffer
vim.keymap.set('n', '<leader>rf', function()
  ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end, opts_with_desc("Start GHCi repl for current buffer"))
vim.keymap.set('n', '<leader>rq', ht.repl.quit, opts_with_desc("Quit GHCi repl"))

-- Restart HLS
vim.keymap.set('n', '<leader>rs', ht.lsp.restart, opts_with_desc("Restart HSL"))
