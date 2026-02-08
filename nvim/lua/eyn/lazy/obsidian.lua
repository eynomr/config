-- Obsidian.nvim integration
-- Only load if the vault exists on this machine
local vault_path = vim.fn.expand("~/Library/Mobile Documents/iCloud~md~obsidian/Documents/eynspace")
if vim.fn.isdirectory(vault_path) == 0 then
  return {}
end

return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = false,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function(_, opts)
    -- Set conceallevel for markdown so obsidian UI renders properly
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        vim.opt_local.conceallevel = 1
      end,
    })
    require("obsidian").setup(opts)
  end,
  opts = {
    workspaces = {
      {
        name = "eynspace",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/eynspace",
      },
    },

    notes_subdir = "inbox",

    new_notes_location = "notes_subdir",

    daily_notes = {
      folder = "daily",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
      template = nil,
    },

    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },

    -- How wiki links are completed
    wiki_link_func = function(opts)
      return require("obsidian.util").wiki_link_id_prefix(opts)
    end,

    -- Note ID generation
    note_id_func = function(title)
      local suffix = ""
      if title ~= nil then
        -- Clean title into valid filename
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        -- If no title, generate 4 random hex chars
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return suffix
    end,

    -- Note frontmatter
    frontmatter_func = function(note)
      if note.title then
        note:add_alias(note.title)
      end
      local out = { id = note.id, aliases = note.aliases, tags = note.tags }
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      return out
    end,

    -- Use Telescope for picking
    picker = {
      name = "telescope.nvim",
      mappings = {
        new = "<C-x>",
        insert_link = "<C-l>",
      },
    },

    -- Disable legacy command names (use e.g. "Obsidian backlinks" instead of "ObsidianBacklinks")
    legacy_commands = false,

    ui = {
      enable = true,
      bullets = { char = "•", hl_group = "ObsidianBullet" },
      external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      reference_text = { hl_group = "ObsidianRefText" },
      highlight_text = { hl_group = "ObsidianHighlightText" },
      tags = { hl_group = "ObsidianTag" },
    },

    checkbox = {
      order = { " ", "x", ">", "~" },
      chars = {
        [" "] = "󰄱",
        ["x"] = "",
        [">"] = "",
        ["~"] = "󰰱",
      },
    },
  },

  keys = {
    { "<leader>no", "<cmd>Obsidian open<cr>", desc = "Open in Obsidian" },
    { "<leader>nn", "<cmd>Obsidian new<cr>", desc = "New note" },
    { "<leader>nd", "<cmd>Obsidian dailies<cr>", desc = "Daily notes" },
    { "<leader>nt", "<cmd>Obsidian today<cr>", desc = "Today's note" },
    { "<leader>ns", "<cmd>Obsidian quick_switch<cr>", desc = "Quick switch" },
    { "<leader>nf", "<cmd>Obsidian search<cr>", desc = "Search vault" },
    { "<leader>nb", "<cmd>Obsidian backlinks<cr>", desc = "Backlinks" },
    { "<leader>nl", "<cmd>Obsidian links<cr>", desc = "Links in note" },
    { "<leader>nk", "<cmd>Obsidian tags<cr>", desc = "Search tags" },
    { "<leader>np", "<cmd>Obsidian paste_img<cr>", desc = "Paste image" },
    { "<leader>nr", "<cmd>Obsidian rename<cr>", desc = "Rename note" },
    { "<leader>ch", "<cmd>Obsidian toggle_checkbox<cr>", desc = "Toggle checkbox" },
  },
}
