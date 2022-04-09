local M = {}

function M.setup()
  vim.g.ale_linters = {
    cs = { 'OmniSharp' }
  }

  vim.g.ale_linters_explicit = 1

  -- disable ale's echo cursor, because of annoying bug when string is too long
  vim.g.ale_echo_cursor = 0

  -- vim.g.ale_virtualtext_cursor = 1

  vim.g.ale_send_to_neovim_diagnostics = 1
end

return M
