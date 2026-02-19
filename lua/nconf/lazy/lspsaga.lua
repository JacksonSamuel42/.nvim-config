return {
    'nvimdev/lspsaga.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
    require('lspsaga').setup({
        ui = {
            border = 'rounded',
            devicon = true,
        },
        -- Breadcrumbs at the top
        symbol_in_winbar = {
            enable = true,
            separator = ' › ',
            show_file = true,
        },
        -- Sidebar outline settings
        outline = {
            win_width = 30,
            auto_preview = true,
        },
        -- Floating terminal settings
        terminal = {
            shell = vim.o.shell,
            border = 'rounded',
        },
        lightbulb = {
            enable = false, -- Disabled as per your previous preference
        },
    })

    -- Keymaps
    local keymap = vim.keymap.set

    -- NAVIGATION & SEARCH
    keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { desc = "LSP Finder" })
    keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" })
    keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { desc = "Smart Rename" })
    keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover Doc" })

    -- OUTLINE & TERMINAL
    -- Toggle the symbol sidebar
    keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { desc = "Toggle Outline" })
    -- Toggle floating terminal (Alt + d)
    keymap({"n", "t"}, "<A-d>", "<cmd>Lspsaga term_toggle<CR>", { desc = "Floating Terminal" })

    -- CALL HIERARCHY (Great for Rust/C++)
    keymap("n", "gi", "<cmd>Lspsaga incoming_calls<CR>", { desc = "Incoming Calls" })
    keymap("n", "go", "<cmd>Lspsaga outgoing_calls<CR>", { desc = "Outgoing Calls" })

    -- ACTIONS & DIAGNOSTICS
    keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" })
    keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Next Diagnostic" })
    keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Prev Diagnostic" })
    end,
}
