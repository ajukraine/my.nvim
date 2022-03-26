return {
  config = function()
    require('nvim-treesitter.configs').setup {
      highlight = {
        enable = true,
        disable = {},
      },
      indent = {
        enable = false,
        disable = {},
      },
      ensure_installed = {
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
        "lua",
        "vim",
        -- "elixir",
        -- "c",
        "c_sharp"
      },
      sync_install = false,
      -- refactor = {
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
              -- textobjects = {
                --   select = {
                  --     enable = true,
                  --     lookahead = true,
                  --     keymaps = {
                    --       ["af"] = "@function.outer",
                    --       ["if"] = "@function.inner",
                    --     }
                    --   }
                    -- }
                  }
                end
              }
