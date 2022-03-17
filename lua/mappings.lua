local utils = require('utils')
local nnoremap = utils.nnoremap
local map = utils.map

vim.g.mapleader = ' '

nnoremap('<leader>w',  ':w<CR>')
nnoremap('<leader>q',  ':q<CR>')
nnoremap('<leader>d',  ':bp|bd #<CR>')
nnoremap('<leader>z',  ':Twilight<CR>')
nnoremap('<leader>fb', ':Telescope buffers<cr>')
nnoremap('<leader>fs', ':Telescope current_buffer_fuzzy_find<cr>')
nnoremap('<leader>ff', ':Telescope find_files<cr>')
nnoremap('<leader>g',  ':Git<cr>')

nnoremap('<Tab>',      ':bnext<CR>')
nnoremap('<S-Tab>',    ':bprev<CR>')
nnoremap('<C-n>',      ':NvimTreeToggle<CR>')

map({ 'x', 'n' }, 'ga', '<Plug>(EasyAlign)')
