local utils = require('utils')
local map = utils.map
local cmd = utils.cmd

vim.g.mapleader = ' '

cmd('<leader>w',  'w')
cmd('<leader>q',  'q')
cmd('<leader>d',  'bp|bd #')
cmd('<leader>z',  'Twilight')
cmd('<leader>g',  'Git')
cmd('<leader>e',  'NvimTreeToggle')

cmd('<Tab>',      'bnext')
cmd('<S-Tab>',    'bprev')

cmd('<leader>gb', 'Gitsigns toggle_current_line_blame')

-- Telescope
local telescope_prefix = '<leader><leader>'
local telescope_mappings = {
  ['b']  = 'buffers',
  ['f']  = 'find_files',
  ['g']  = 'git_files',
  ['s']  = 'current_buffer_fuzzy_find',
  ['ls'] = 'lsp_dynamic_workspace_symbols',
  ['lr'] = 'lsp_references',
  ['li'] = 'lsp_implementations',
  ['la'] = 'lsp_code_actions',
}

for key, picker in pairs(telescope_mappings) do
  cmd(telescope_prefix .. key, "lua require'telescope.builtin'." .. picker .. "{}")
end


map({ 'x', 'n' }, 'ga', '<Plug>(EasyAlign)')
