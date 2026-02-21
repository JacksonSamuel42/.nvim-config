return {
    {
        'numToStr/Comment.nvim',
        dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
        config = function()
        require('Comment').setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
                                 padding = true,
                                 sticky = true,
                                 toggler = {
                                     line = 'gcc',
                                 block = 'gbc',
                                 },
        })

        -- KEYMAPS
        local keymap = vim.keymap.set
        keymap('n', '<leader>/', 'gcc', { remap = true, desc = "Toggle comment" })
        keymap('v', '<leader>/', 'gc', { remap = true, desc = "Toggle comment" })
        end
    },

    {
        'JoosepAlviste/nvim-ts-context-commentstring',
        config = function()
        require('ts_context_commentstring').setup {
            enable_autocmd = false,
        }
        end
    }
}
