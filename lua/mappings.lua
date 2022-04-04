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

cmd('dq', 'cclose')
cmd('dl', 'lclose')

cmd('<leader>tt', '<Plug>(ultest-run-nearest)')

-- Telescope
local telescope_prefix = '<leader><leader>'
local telescope_pickers = {
  ['b']  = 'buffers',
  ['f']  = 'find_files',
  ['gf'] = 'git_files',
  ['gs'] = 'git_status',
  ['s']  = 'current_buffer_fuzzy_find',
  ['ls'] = 'lsp_dynamic_workspace_symbols',
  ['lr'] = 'lsp_references',
  ['li'] = 'lsp_implementations',
  ['la'] = { 'lsp_code_actions', initial_mode = 'normal' },
}

for key, picker in pairs(telescope_pickers) do
  local opts = {}
  if type(picker) == 'table' then
    -- TODO: remove 1st element from 'picker'
    opts = picker
    picker = picker[1]
  end

  cmd(telescope_prefix .. key,
    function() require'telescope.builtin'[picker](opts) end)
end


map({ 'x', 'n' }, 'ga', '<Plug>(EasyAlign)')
