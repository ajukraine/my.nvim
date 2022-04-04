local M = {}

function M.setup()
  vim.g.OmniSharp_server_use_net6 = 1
  vim.g.OmniSharp_highlighting = 0
  vim.g.OmniSharp_highlight_groups = {
    EnumMemberName = 'Identifier',
    ClassName = '',
    ParameterName = '',
    PropertyName = '',
    LocalName = '',
    FieldName = '',
    ConstantName = '',
    Keyword = 'TSKeyword',
    ControlKeyword = 'TSKeyword',
    StringLiteral = 'TSString',
    NumericLiteral = 'TSNumber',
    Operator = 'TSOperator',
  }

  local function create_mappings()
    local mappings = {
      ['<leader>l'] = '<Plug>(omnisharp_find_usages)',
      ['<leader>D'] = '<Plug>(omnisharp_go_to_definition)',
      ['<leader>i'] = '<Plug>(omnisharp_find_implementations)',
      ['<leader>r'] = '<Plug>(omnisharp_rename)',
      ['<leader>a'] = '<Plug>(omnisharp_code_actions)',
      ['[[']        = '<Plug>(omnisharp_navigate_up)',
      [']]']        = '<Plug>(omnisharp_navigate_down)',
    }

    for lhs, rhs in pairs(mappings) do
      vim.keymap.set('n', lhs, rhs, { noremap = true, silent = true, buffer = true })
    end
  end

  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'cs',
    callback = create_mappings,
    group = vim.api.nvim_create_augroup('OmniSharpMappings', {})
  })

  vim.g.OmniSharp_fzf_options = {
    down = '30%'
  }
end

return M
