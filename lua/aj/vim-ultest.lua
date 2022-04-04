return function()
  -- configure ultest-vim to use only 1 thread
  vim.g.ultest_max_threads = 1

  -- configure ultest-vim to use pty
  vim.g.ultest_use_pty = 1

  -- vim.g.ultest_summary_open = 'botright split | resize ' .. vim.g.ultest_summary_width

  -- add new pattern to test csharp patterns
  local patterns = vim.g['test#csharp#patterns']
  table.insert(patterns.test, [[\v^\s*public Task (\w+)]])
  vim.g['test#csharp#patterns'] = patterns

  -- create autocmd using lua nvim_autogroup_create
  vim.api.nvim_create_autocmd('ColorScheme', {
    pattern = 'gruvbox-material',
    callback = function()
      vim.cmd [[
      hi! link UltestFail             RedSign
      hi! link UltestPass             GreenSign
      hi! link UltestRunning          YellowSign
      hi! link UltestSummaryInfo      Aqua
      hi! link UltestSummaryFile      UltestSummaryInfo
      hi! link UltestSummaryNamespace UltestSummaryInfo
      ]]
    end,
    nested  = true,
    group   = vim.api.nvim_create_augroup('UltestColors', {})
  })

end
