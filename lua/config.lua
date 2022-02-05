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
    "javascript",
    "tsx",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    -- "swift",
    "html",
    "scss",
    "lua",
    "elixir",
    "c"
  },
  sync_install = false,
  refactor = {
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
    highlight_definitions = {
      enable = true,
      -- Set to false if you have an `updatetime` of ~100.
      clear_on_cursor_move = false,
    },
  },
}

local parser_config = require ("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }

require("twilight").setup {
  dimming = {
    inactive = true
  },
}

require("nvim-treesitter.configs").setup {
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

require('gitsigns').setup {
  signs = { 
    add = { text = '+' },
    change = { text = '~' }
  },
  on_attach = function(bufnr)
    local function map(mode, lhs, rhs, opts)
        opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end
    
    -- Navigation
    map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
    map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})
    
    -- Actions
    -- map('n', '<leader>hs', '<cmd>Gitsigns stage_hunk<CR>')
    -- map('v', '<leader>hs', '<cmd>Gitsigns stage_hunk<CR>')
    -- map('n', '<leader>hr', '<cmd>Gitsigns reset_hunk<CR>')
    -- map('v', '<leader>hr', '<cmd>Gitsigns reset_hunk<CR>')
    -- map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
    -- map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
    -- map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
    -- map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
    -- map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
    -- map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
    -- map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
    -- map('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
    -- map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')
    
    -- Text object                                        
    -- map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    -- map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}

require("toggleterm").setup{
  direction = 'float',
  shell = 'powershell',
  open_mapping = [[<c-\>]]
}

require('nvim-tree').setup {
  update_cwd = true
}

vim.g.nvim_tree_icons = {
  default = '',
  symlink = ''
}

require('lualine').setup {
  options = {
    theme = 'gruvbox-material'
  },
  sections = {
    lualine_x = {
      'encoding',
      'fileformat',
      {
        'filetype',
        colored = false
      }
    }
  },

  tabline = {
    lualine_a = {'buffers'}
  },
  extensions = { 'nvim-tree' }
}

vim.g['fsharp#fsautocomplete_command'] = { 'fsautocomplete',  '--background-service-enabled' }
vim.g['fsharp#lsp_auto_setup'] = 0
require('ionide').setup {}

require('filetype').setup {
  overrides = {
    extensions = {
      fsproj = "xml",
      fs = "fsharp"
    }
  }
}
lspconfig.clangd.setup {
}
