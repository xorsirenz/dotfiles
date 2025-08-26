return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup{
      size = 4,
      open_mapping = [[<c-s>]]
    }
  end
}
