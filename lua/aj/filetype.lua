return function()
  require('filetype').setup {
    overrides = {
      extensions = {
        fs   = 'fsharp',
      }
    }
  }
end
