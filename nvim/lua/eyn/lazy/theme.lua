
function SetMyTheme(theme)
    theme = theme or "vscode"
    vim.cmd.colorscheme(theme)
end
return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function ()
            require("rose-pine").setup({
                styles = {
                    italic = false
                }
            })

            SetMyTheme();
        end
    },
    {
        "Mofiqul/vscode.nvim",
        name="vscode",
        config = function ()
            require("vscode").setup({})

            SetMyTheme();
        end
    },
    {
        "slugbyte/lackluster.nvim",
        name="lackluster",
        config = function ()
            require("lackluster").setup({})

            SetMyTheme();
        end
    }
}

