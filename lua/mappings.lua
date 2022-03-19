local utils = require('utils')
local nnoremap = utils.nnoremap
local map = utils.map

local function cmd(shortcut, command)
  return nnoremap(shortcut, ':' .. command .. '<CR>')
end

vim.g.mapleader = ' '

cmd('<leader>w',  'w')
cmd('<leader>q',  'q')
cmd('<leader>d',  'bp|bd #')
cmd('<leader>z',  'Twilight')
cmd('<leader>fb', 'Telescope buffers')
cmd('<leader>fs', 'Telescope current_buffer_fuzzy_find')
cmd('<leader>ff', 'Telescope find_files')
cmd('<leader>g',  'Git')
cmd('<leader>e',  'NvimTreeToggle')

cmd('<Tab>',      'bnext')
cmd('<S-Tab>',    'bprev')

cmd('<leader>gb', 'Gitsigns toggle_current_line_blame')

map({ 'x', 'n' }, 'ga', '<Plug>(EasyAlign)')
