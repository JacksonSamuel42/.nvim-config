return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre", -- Only load when you open a file
  config = function()
    require('gitsigns').setup({
      signs = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- NAVIGATION (Jump between changes)
        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true, desc = "Next Change" })

        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true, desc = "Prev Change" })

        -- ACTIONS (Manage your changes)
        map('n', '<leader>hs', gs.stage_hunk, { desc = "Stage Hunk" })
        map('n', '<leader>hr', gs.reset_hunk, { desc = "Reset Hunk" })
        map('n', '<leader>hp', gs.preview_hunk, { desc = "Preview Hunk" })
        map('n', '<leader>hb', function() gs.blame_line{full=true} end, { desc = "Git Blame Line" })
        map('n', '<leader>hd', gs.diffthis, { desc = "Diff This File" })
      end
    })
  end
}
