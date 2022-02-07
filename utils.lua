local M = { }

function M.nnoremap(shortcut, command, opts)
  local options = {noremap = true}
  local mode = 'n'

  if opts then options = vim.tbl_extend('force', options, opts) end
  
  vim.api.nvim_set_keymap(mode, shortcut, command, options)
end

return M
