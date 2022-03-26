return function ()
  local cmp = require 'cmp'

  cmp.setup {
    sources = {
      { name = 'buffer' }
    },
    experimental = {
      ghost_text = true,
      native_menu = false
    }
  }
end
