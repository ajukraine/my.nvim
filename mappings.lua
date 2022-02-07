local utils = require('utils')
local nnoremap = utils.nnoremap

vim.g.mapleader = ' '

nnoremap('<leader>w', ':w<CR>')
nnoremap('<leader>q', ':q<CR>')
nnoremap('<leader>z', ':Twilight<CR>')
nnoremap('<leader>fb', '<cmd>Telescope buffers<cr>')
nnoremap('<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
nnoremap('<leader>ff', '<cmd>Telescope find_files<cr>')
nnoremap('<leader>g', '<cmd>Git<cr>')

nnoremap('<Tab>', ':bnext<CR>')
nnoremap('<C-n>', ':NvimTreeToggle<CR>')
