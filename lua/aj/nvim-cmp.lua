return function ()
  local cmp = require 'cmp'

  cmp.setup {
    sources = {
      { name = 'nvim_lsp' },
      { name = 'buffer', keyword_length = 5 }
    },
    experimental = {
      ghost_text = false,
      native_menu = false
    }
  }
end
