vim.cmd [[
filetype plugin indent on
syntax on
]]

vim.api.nvim_create_autocmd('VimEnter', {
  pattern = '*',
  command = [[colorscheme gruvbox-material]],
  nested  = true,
  group   = vim.api.nvim_create_augroup('Colorscheme', {})
})

local options = {
  compatible     = false,
  termguicolors  = true,
  background     = 'dark',
  number         = true,
  relativenumber = true,
  cursorline     = true,
  signcolumn     = 'yes',
  title          = true,
  splitright     = true,
  splitbelow     = true,
  mouse          = 'a',
  hidden         = true,
  wildmenu       = true,
  expandtab      = true,
  shiftwidth     = 2,
  softtabstop    = 2,
  scrolloff      = 5
}

for name, value in pairs(options) do
  vim.o[name] = value
end
