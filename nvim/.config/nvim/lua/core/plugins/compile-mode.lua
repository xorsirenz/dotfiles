return {
  "ej-shafran/compile-mode.nvim",
  version = "^5.0.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    ---@type CompileModeOpts
    vim.g.compile_mode = {
        default_command = {
            go = "go run %",
            lua = "lua ",
            python = "python %",
            zig = "zig run %",
        },
        input_word_completion = true,
        bang_expansion = true,
    }
  end
}
