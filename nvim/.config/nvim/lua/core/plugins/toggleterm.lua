return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup{
      size = 5,
      open_mapping = [[<c-\>]]
    }
  end
}
