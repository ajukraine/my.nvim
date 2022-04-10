return function()
  local configs = require('nvim-treesitter.configs')

  configs.setup {
    highlight = {
      enable = true,
      disable = {},
    },
    indent = {
      enable = false,
      disable = {},
    },
    ensure_installed = {
      "lua",
      "vim",
      "c_sharp",
      -- "javascript",
      -- "tsx",
      -- "toml",
      -- "fish",
      -- "php",
      -- "json",
      -- "yaml",
      -- "swift",
      -- "html",
      -- "scss",
      -- "elixir",
      -- "c",
    },
    sync_install = false
  }

  configs.setup {
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
        }
      }
    }
  }
end
--   smart_rename = {
  --     enable = true,
  --     keymaps = {
    --       smart_rename = "grr",
    --     },
    --   },
    --   highlight_definitions = {
      --     enable = true,
      --     -- Set to false if you have an `updatetime` of ~100.
      --     clear_on_cursor_move = false,
      --   },
      -- },
