local M = { }

-- function M.nnoremap(shortcut, command, opts)
--   local options = {noremap = true}
--   local mode = 'n'
--
--   if opts then options = vim.tbl_extend('force', options, opts) end
--   
--   vim.api.nvim_set_keymap(mode, shortcut, command, options)
-- end

function M.map(modes, shortcut, command, options)
  options = options or {}

  if type(modes) ~= 'table' then
    return vim.api.nvim_set_keymap(modes, shortcut, command, options)
  end

  for _, mode in ipairs(modes) do
    vim.api.nvim_set_keymap(mode, shortcut, command, options)
  end
end

function M.nnoremap(shortcut, command)
  M.map('n', shortcut, command, { noremap = true })
end

return M
