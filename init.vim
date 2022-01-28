set nocompatible

call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-gruvbox8'
Plug 'digitaltoad/vim-pug'
Plug 'tomtom/tcomment_vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/twilight.nvim'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

call plug#end()

:lua require('config')

filetype plugin indent on
syntax on

set termguicolors
set background=dark
autocmd vimenter * ++nested colorscheme gruvbox8

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

let mapleader = " "
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>z :Twilight<CR>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fs <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>

nmap <leader><Tab> :bnext<CR>
