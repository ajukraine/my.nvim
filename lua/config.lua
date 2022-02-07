require('packer').startup(function ()

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Fixes slow built-in filetype.vim
  use 'nathom/filetype.nvim'

  -- Improves startup time with use of optimizations and caching
  use 'lewis6991/impatient.nvim'

  use {
    'sainnhe/gruvbox-material',
    setup = function ()
      vim.g.gruvbox_material_better_performance = 1

      vim.g.gruvbox_italics = 0
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_enable_italic = 0
    end
  }

  use { 'dstein64/vim-startuptime', cmd = 'StartupTime' }
  
  use 'tomtom/tcomment_vim'
  use 'tpope/vim-unimpaired'

  use { 'kyazdani42/nvim-web-devicons', opt = true }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    cmd = 'NvimTreeToggle',
    config = function ()
      vim.g.nvim_tree_icons = {
        default = '',
        symlink = ''
      }

      require('nvim-tree').setup {
        update_cwd = true
      }
    end
  }

  -- use 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  -- use 'folke/twilight.nvim'
  -- use 'nvim-treesitter/nvim-treesitter-textobjects'
  -- use 'nvim-treesitter/nvim-treesitter-refactor'
  --
  -- use 'neovim/nvim-lspconfig'
  -- use 'hrsh7th/nvim-cmp'
  -- use 'hrsh7th/cmp-nvim-lsp'
  -- use 'onsails/lspkind-nvim'
  --
  -- use 'L3MON4D3/LuaSnip'
  -- use 'saadparwaiz1/cmp_luasnip'
  -- use 'honza/vim-snippets'
  --
  -- use 'nvim-lua/plenary.nvim'
  -- use 'nvim-telescope/telescope.nvim'
  --
  -- use 'tpope/vim-fugitive'
  -- use 'lewis6991/gitsigns.nvim'
  --
  -- use 'mhinz/vim-startify'
  -- use 'nvim-lualine/lualine.nvim'
  -- use 'akinsho/toggleterm.nvim'
  --
  -- use 'ionide/Ionide-vim' --, { 'do':  'powershell -ExecutionPolicy Unrestricted .\install.ps1' }
  -- -- use 'OmniSharp/omnisharp-vim'
  -- use 'digitaltoad/vim-pug'
  --
  -- use 'neomake/neomake'
  --
end)


-- require('nvim-treesitter.configs').setup {
--   highlight = {
--     enable = true,
--     disable = {},
--   },
--   indent = {
--     enable = false,
--     disable = {},
--   },
--   ensure_installed = {
--     "javascript",
--     "tsx",
--     "toml",
--     "fish",
--     "php",
--     "json",
--     "yaml",
--     -- "swift",
--     "html",
--     "scss",
--     "lua",
--     "elixir",
--     "c",
--     "c_sharp"
--   },
--   sync_install = false,
--   refactor = {
--     smart_rename = {
--       enable = true,
--       keymaps = {
--         smart_rename = "grr",
--       },
--     },
--     highlight_definitions = {
--       enable = true,
--       -- Set to false if you have an `updatetime` of ~100.
--       clear_on_cursor_move = false,
--     },
--   },
--   textobjects = {
--     select = {
--       enable = true,
--       lookahead = true,
--       keymaps = {
--         ["af"] = "@function.outer",
--         ["if"] = "@function.inner",
--       }
--     }
--   }
-- }
--
-- local parser_config = require ("nvim-treesitter.parsers").get_parser_configs()
-- parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
--
-- require("twilight").setup {
--   dimming = {
--     inactive = true
--   },
-- }
--
-- require('gitsigns').setup {
--   signs = { 
--     add = { text = '+' },
--     change = { text = '~' }
--   },
--   on_attach = function(bufnr)
--     local function map(mode, lhs, rhs, opts)
--         opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
--         vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
--     end
--     
--     -- Navigation
--     map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
--     map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})
--     
--     -- Actions
--     -- map('n', '<leader>hs', '<cmd>Gitsigns stage_hunk<CR>')
--     -- map('v', '<leader>hs', '<cmd>Gitsigns stage_hunk<CR>')
--     -- map('n', '<leader>hr', '<cmd>Gitsigns reset_hunk<CR>')
--     -- map('v', '<leader>hr', '<cmd>Gitsigns reset_hunk<CR>')
--     -- map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
--     -- map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
--     -- map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
--     -- map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
--     -- map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
--     -- map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
--     -- map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
--     -- map('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
--     -- map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')
--     
--     -- Text object                                        
--     -- map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
--     -- map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
--   end
-- }
--
-- require("toggleterm").setup {
--   direction = 'float',
--   shell = 'powershell',
--   open_mapping = [[<c-\>]]
-- }
--
--
-- require('lualine').setup {
--   options = {
--     theme = 'gruvbox-material'
--   },
--   sections = {
--     lualine_x = {
--       'encoding',
--       'fileformat',
--       {
--         'filetype',
--         colored = false
--       }
--     }
--   },
--
--   tabline = {
--     lualine_a = {'buffers'}
--   },
--   extensions = { 'nvim-tree' }
-- }
--
-- require('filetype').setup {
--   overrides = {
--     extensions = {
--       fsproj = "xml",
--       fs = "fsharp",
--       csx = "cs"
--     }
--   }
-- }
--
-- -- Add additional capabilities supported by nvim-cmp
-- local cmp_capabilities = vim.lsp.protocol.make_client_capabilities()
-- cmp_capabilities = require('cmp_nvim_lsp')
--   .update_capabilities(cmp_capabilities, { snippetSupport = true })
--
-- local lspconfig = require('lspconfig')
-- lspconfig.clangd.setup {
--   capabilities = cmp_capabilities
-- }
--
-- vim.g['fsharp#fsautocomplete_command'] = { 'fsautocomplete',  '--background-service-enabled' }
-- vim.g['fsharp#lsp_auto_setup'] = 0
-- require('ionide').setup {
--   capabilities = cmp_capabilities
-- }
--
-- local pid = vim.fn.getpid()
--
-- local util = lspconfig.util
-- lspconfig.omnisharp.setup {
--   cmd = { "omnisharp.exe", "--languageserver" , "--hostPID", tostring(pid) },
--   filetypes = { 'cs', 'csx' },
--   capabilities = cmp_capabilities,
--   root_dir = function(file, _)
--     if file:sub(-#".csx") == ".csx" then
--       return util.path.dirname(file)
--     end
--     return util.root_pattern("*.sln")(file) or util.root_pattern("*.csproj")(file)
--   end,
--   -- on_attach = function(_, bufnr)
--   --   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--   -- end
-- }
--
-- -- nvim-cmp setup
-- local cmp = require('cmp')
-- local lspkind = require('lspkind')
-- local luasnip = require('luasnip')
--
-- require("luasnip.loaders.from_snipmate").load()
--
-- cmp.setup {
--   formatting = {
--     format = lspkind.cmp_format({
--       -- with_text = true,
--       menu = ({
--         buffer = "[Buffer]",
--         nvim_lsp = "[LSP]",
--         luasnip = "[LuaSnip]",
--         nvim_lua = "[Lua]",
--         latex_symbols = "[Latex]",
--       })
--     }),
--   },
--   snippet = {
--     expand = function(args)
--       require('luasnip').lsp_expand(args.body)
--     end,
--   },
--   mapping = {
--     ['<C-p>'] = cmp.mapping.select_prev_item(),
--     ['<C-n>'] = cmp.mapping.select_next_item(),
--     ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-f>'] = cmp.mapping.scroll_docs(4),
--     ['<C-Space>'] = cmp.mapping.complete(),
--     ['<C-e>'] = cmp.mapping.close(),
--     ['<CR>'] = cmp.mapping.confirm {
--       behavior = cmp.ConfirmBehavior.Replace,
--       select = true,
--     },
--     ['<Tab>'] = function(fallback)
--       if cmp.visible() then
--         cmp.select_next_item()
--       elseif luasnip.expand_or_jumpable() then
--         luasnip.expand_or_jump()
--       else
--         fallback()
--       end
--     end,
--     ['<S-Tab>'] = function(fallback)
--       if cmp.visible() then
--         cmp.select_prev_item()
--       elseif luasnip.jumpable(-1) then
--         luasnip.jump(-1)
--       else
--         fallback()
--       end
--     end,
--   },
--   sources = {
--     { name = 'nvim_lsp' },
--     { name = 'luasnip' },
--   },
-- }
--
