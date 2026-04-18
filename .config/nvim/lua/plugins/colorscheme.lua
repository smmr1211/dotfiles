return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000, -- 一番最初にロード
    config = function()
      vim.o.background = "dark" -- または "light"
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
}
