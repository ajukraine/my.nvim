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
    return vim.keymap.set(modes, shortcut, command, options)
  end

  for _, mode in ipairs(modes) do
    vim.keymap.set(mode, shortcut, command, options)
  end
end

function M.nnoremap(shortcut, command)
  M.map('n', shortcut, command, { noremap = true })
end

function M.cmd(shortcut, command)
  if type(command) == 'function' then
    return M.nnoremap(shortcut, command)
  end

  return M.nnoremap(shortcut, ':' .. command .. '<CR>')
end


return M
