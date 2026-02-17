return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
    require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
            width = 30,
        },
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = false,
        },
    })

    -- Your requested keybind: Focus/Find current file in the tree
    vim.keymap.set('n', '<c-n>', ':NvimTreeFindFile<CR>', { desc = 'NvimTree Find File' })

    -- Recommended: A simple toggle for the sidebar
    vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
    end,
}
