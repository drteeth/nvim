vim.g.NERDTreeGitStatusWithFlags = 1
vim.g.NERDTreeIgnore = {
  '^node_modules$',
  '~$',
  '_build[[dir]]',
  'deps[[dir]]',
  'erl_crash.dump[[file]]'
}

vim.cmd("let g:test#strategy = 'neoterm'")
vim.cmd("let g:test#preserve_screen = 0")

vim.cmd("let g:neoterm_default_mod = 'vert'")
vim.cmd("let g:neoterm_autoscroll = 1")
vim.cmd("let g:neoterm_keep_term_open = 0")
vim.cmd("let g:neoterm_automap_keys = ',oo'")

-- require("elixir").setup()
