return {
    'rmagatti/auto-session',
    lazy = false,
    config = function()
    require("auto-session").setup({
        log_level = "error",
        auto_restore_enabled = false,
        auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },

        continue_restore_on_error = true,

        session_lens = {
            load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
        },
    })

    -- KEYMAPS
    local keymap = vim.keymap.set
        keymap("n", "<leader>wr", "<cmd>AutoSession search<CR>", { desc = "Search sessions" })
        keymap("n", "<leader>ws", "<cmd>AutoSession save<CR>", { desc = "Save session" })
        keymap("n", "<leader>wa", "<cmd>AutoSession toggle<CR>", { desc = "Toggle autosave" })
    end,
}
