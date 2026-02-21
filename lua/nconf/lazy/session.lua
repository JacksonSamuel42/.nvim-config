return {
    "Shatur/neovim-session-manager",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim", -- Optional: for the visual picker
    },
    config = function()
    local config = require("session_manager.config")
    require("session_manager").setup({
        -- Choose how sessions are loaded on startup.
        -- CurrentDirSession: loads session for current folder
        -- LastSession: loads the last session regardless of folder
        autoload_mode = config.AutoloadMode.CurrentDir,
        autosave_last_session = true,
        autosave_ignore_not_normal = true, -- Won't save if you only have a terminal or help open
        autosave_ignore_dirs = { "~/", "/" },
        autosave_ignore_filetypes = {
            'gitcommit',
            'gitrebase',
            'lspsagaoutline',
            'map',
        },
    })

    -- KEYMAPS
    local keymap = vim.keymap.set
    -- Load a session from a list
    keymap("n", "<leader>wr", "<cmd>SessionManager load_session<CR>", { desc = "Search sessions" })
    -- Save current state
    keymap("n", "<leader>ws", "<cmd>SessionManager save_current_session<CR>", { desc = "Save session" })
    -- Delete a session
    keymap("n", "<leader>wd", "<cmd>SessionManager delete_session<CR>", { desc = "Delete session" })
    -- Load the last session used
    keymap("n", "<leader>wl", "<cmd>SessionManager load_last_session<CR>", { desc = "Load last session" })
    end,
}
