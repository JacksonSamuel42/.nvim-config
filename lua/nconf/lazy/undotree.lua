return {
    "mbbill/undotree",
    config = function()
    -- Setting up the keymap to toggle Undotree
    vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_HelpLine = 0
    end
}
