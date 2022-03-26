return {
  config = function ()
    vim.g.sqlfmt_command = 'sqlformat'
    vim.g.sqlfmt_options = '-r -k upper'
  end
}
