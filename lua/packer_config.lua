local function configure_plugins(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Fixes slow built-in filetype.vim
  use 'nathom/filetype.nvim'

  -- Improves startup time with use of optimizations and caching
  use 'lewis6991/impatient.nvim'

  use { 'dstein64/vim-startuptime', cmd = 'StartupTime', cond = DEBUG }

  use 'sainnhe/gruvbox-material'

  use 'tpope/vim-unimpaired'
  use 'junegunn/vim-easy-align'

  -- FIX: Currently can't load config with '.' suffix in name
  use {
    'kyazdani42/nvim-tree.lua',
    as = 'nvim-tree',
    requires = { 'kyazdani42/nvim-web-devicons' },
    cmd = 'NvimTreeToggle',
  }

  use { 'lewis6991/gitsigns.nvim', as = 'gitsigns', requires = { 'nvim-lua/plenary.nvim' }, }

  use 'nvim-treesitter/nvim-treesitter'

  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  -- Alternative to 'tomtom/tcomment_vim'
  use { 'numToStr/Comment.nvim', config = function() require('Comment').setup{} end }
  use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim", config = function() require("todo-comments").setup{} end }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp'
    }
  }

  use { 'kristijanhusak/vim-dadbod-ui', requires = { 'tpope/vim-dadbod' }, cmd = 'DBUI' }

  use 'b4b4r07/vim-sqlfmt'

  use 'mustache/vim-mustache-handlebars'

  use 'diepm/vim-rest-console'

  use 'editorconfig/editorconfig-vim'

  -- use 'folke/twilight.nvim'
  -- use 'nvim-treesitter/nvim-treesitter-textobjects'
  -- use 'nvim-treesitter/nvim-treesitter-refactor'
  --
  -- use 'hrsh7th/cmp-nvim-lsp'
  -- use 'onsails/lspkind-nvim'
  --
  -- use 'L3MON4D3/LuaSnip'
  -- use 'saadparwaiz1/cmp_luasnip'
  -- use 'honza/vim-snippets'
  --
  -- use 'tpope/vim-fugitive'
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
end

local packer = require('packer')

-- NOTE: passing 1 as parameter allows to handle every plugin
packer.set_handler(1, function (_, plugin_spec, _)
  local custom_spec_loaded, custom_spec = pcall(require, 'aj.' .. plugin_spec.short_name)
  if custom_spec_loaded then
    if type(custom_spec) == 'function' then
      plugin_spec.config = custom_spec
      return
    end

    plugin_spec.setup = plugin_spec.setup or custom_spec.setup
    plugin_spec.config = plugin_spec.config or custom_spec.config
  end
end)

packer.init {
  profile = {
    enable = DEBUG,
    threshold = 1 -- the amount in ms that a plugins load time must be over for it to be included in the profile
  }
}

configure_plugins(packer.use)

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
