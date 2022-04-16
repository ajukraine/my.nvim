return function ()
  local cmp = require 'cmp'

  cmp.setup {
    sources = {
      { name = 'nvim_lsp' },
      -- { name = 'omni', trigger_characters = { '.' } },
      { name = 'buffer', keyword_length = 5 }
    },
    mapping = cmp.mapping.preset.insert(),
    experimental = {
      ghost_text = false,
    },
    view = {
      entries = 'custom'
    }
  }
end
