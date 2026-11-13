return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local function git_tag()
            local tag = vim.fn.systemlist("git describe --tags --abbrev=0 2>/dev/null")
            return vim.v.shell_error == 0 and tag[1] or ""
        end

        local function search_count()
            local result = vim.fn.searchcount({ maxcount = 999 })

            if result.total == 0 or result.incomplete == 1 then
                return ""
            end

            return string.format("󰍉 %d/%d", result.current, result.total)
        end

        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = "auto",
                component_separators = "",
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = {
                    { git_tag, icon = "󰊢" },
                    "diff",
                    {
                        "diagnostics",
                        sources = { "nvim_lsp" },
                        sections = { "error", "warn" },
                        symbols = { error = "󰅚 ", warn = "󰀪 " },
                        colored = true,
                        always_visible = true,
                    },
                },
                lualine_c = { "filename" },
                lualine_x = { "encoding", "fileformat", "filetype", { search_count }, },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_c = { "filename" },
                lualine_x = { "location" },
            },
        })
    end,
}
