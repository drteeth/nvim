return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim",
          -- Fuzzy Finder Algorithm which requires local dependencies to be built.
          -- Only load if `make` is available. Make sure you have the system
          -- requirements installed.
          {
            'nvim-telescope/telescope-fzf-native.nvim',
            -- NOTE: If you are having trouble with this installation,
            --       refer to the README for telescope-fzf-native for more instructions.
            build = 'make',
            cond = function()
              return vim.fn.executable 'make' == 1
            end,
          },
    },

    config = function()
        require('telescope').setup({})

        -- Enable telescope fzf native, if installed
        pcall(require('telescope').load_extension, 'fzf')

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

        vim.keymap.set('n', '<leader>pb', ":Buffers<CR>", { desc = '[P]roject [B]uffers' })
        vim.keymap.set('n', '<leader>/', ":Rg<CR>", { desc = 'Fuzzy search' })
    end
}

