set nocompatible

call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-gruvbox8'
Plug 'sainnhe/gruvbox-material'
Plug 'digitaltoad/vim-pug'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-unimpaired'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/twilight.nvim'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

Plug 'akinsho/toggleterm.nvim'

Plug 'nvim-lualine/lualine.nvim'

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

Plug 'dstein64/vim-startuptime'

call plug#end()

:lua require('config')

filetype plugin indent on
syntax on

set termguicolors
set background=dark
autocmd vimenter * ++nested colorscheme gruvbox-material

let g:gruvbox_italics = 0
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_italic = 0

set number relativenumber
set cursorline
set signcolumn=yes
set title
set splitright
set splitbelow

set mouse=a

set hidden
set wildmenu

set expandtab
set shiftwidth=2
set softtabstop=2

set scrolloff=5

let mapleader = " "
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>z :Twilight<CR>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fs <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Git<cr>

nnoremap <Tab> :bnext<CR>
nnoremap <C-n> :NvimTreeToggle<CR>
