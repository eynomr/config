return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons"
        },
        config = function ()
            require("neo-tree").setup({
                close_if_last_window = true,
                sources = {
                    "filesystem",
                    "buffers",
                    "git_status"
                },
                window = {
                    width = 30,
                    mappings = {
                        ["<space>"] = "none"
                    }
                },
                filesystem = {
                    bind_to_cwd = true,
                    cwd_target = {
                        sidebar = "window",
                        current = "window"
                    },
                    follow_current_file = { enabled = true },
                    filtered_items = {
                        hide_dotfiles = false,
                        hide_gitignored = false
                    },
                    hijack_netrw_behavior = "open_current",
                },
                enable_git_status = true,
                sort_case_insensitive = false,
            })
        end,
    },

    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = true,
    },

    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("oil").setup({
                view_options = { show_hidden = true },
                skip_confirm_for_simple_edits = true,
                default_file_explorer = true,
                keymaps = {
                    ["<C-h>"] = false, -- Don't override window nav
                    ["<C-l>"] = false,
                },
            })
        end,
    },
}
