return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300 -- Adjust this to make the popup appear faster or slower
  end,
  opts = {
    preset = "helix", 
  },
}
