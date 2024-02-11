return {
    "vim-test/vim-test",
    dependencies = {
      "kassio/neoterm"
    },
    config = function() 
        vim.keymap.set("n", "<LocalLeader>tb", ":TestFile<CR>", { desc = '[T]est [b]uffer' })
        vim.keymap.set("n", "<LocalLeader>tt", ":TestNearest<CR>", { desc = '[T]est [t]he nearest thing' })
        vim.keymap.set("n", "<LocalLeader>ta", ":TestSuite<CR>", { desc = '[T]est [a]ll' })
        vim.keymap.set("n", "<LocalLeader>tr", ":TestLast<CR>", { desc = '[T]est [r]epeat last' })
        vim.keymap.set("n", "<LocalLeader>tv", ":TestVisit<CR>", { desc = '[T]est [v]isit' })

        vim.cmd("let g:test#strategy = 'neoterm'")
        vim.cmd("let g:test#preserve_screen = 0")
    end
}