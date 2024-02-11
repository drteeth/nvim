return {
  "kassio/neoterm",
  config = function ()
    -- Break out of terminal mode
    vim.keymap.set("t", "<C-o>", "<C-\\><C-n>")

    vim.cmd("let g:neoterm_default_mod = 'vert'")
    vim.cmd("let g:neoterm_autoscroll = 1")
    vim.cmd("let g:neoterm_keep_term_open = 0")

    vim.cmd("let g:neoterm_automap_keys = ',oo'") -- HACK to avoid having ',tt' hijacked. See :help Tmap
  end,
}