return function()
  require('filetype').setup {
    overrides = {
      extensions = {
        -- NOTE: Required before PR is merged (https://github.com/nathom/filetype.nvim/pull/83)
        hx = 'haxe',
        hxml = 'hxml',
      }
    }
  }
end
