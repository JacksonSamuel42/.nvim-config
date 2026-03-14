return {
  'goolord/alpha-nvim',
  dependencies = { 
    'nvim-tree/nvim-web-devicons',
    'rmagatti/auto-session', -- Ensure this is here if not already in your plugins
  },
  config = function()
    local dashboard = require('alpha.themes.dashboard')

    -- 1. Define the logo (Fixed syntax and removed internal quotes)
    local logo = [[
      ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
      ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
      ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
      ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
      ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
      ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
    ]]

    -- 2. Set the header correctly (using vim.split to handle the multi-line string)
    dashboard.section.header.val = vim.split(logo, "\n")

    -- 3. Define the buttons
    dashboard.section.buttons.val = {
      dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('f', '󰈞  Find file', ':Telescope find_files<CR>'),
      dashboard.button('r', '󰄉  Recent files', ':Telescope oldfiles<CR>'),
      
      -- Open Telescope inside your Neovim config folder
      dashboard.button('c', '  Config', ':Telescope find_files cwd=~/.config/nvim<CR>'),

      -- auto-session uses the 'session-lens' extension for Telescope
      dashboard.button('s', '󰚰  Sessions', ':Telescope session-lens search_session<CR>'), 

      dashboard.button('q', '󰅚  Quit', ':qa<CR>'),
    }

    require('alpha').setup(dashboard.config)
  end
}
