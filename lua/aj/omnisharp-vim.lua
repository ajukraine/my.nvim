local M = {}

function M.setup()
  vim.g.OmniSharp_server_use_net6 = 1
  vim.g.OmniSharp_highlighting = 0
  vim.g.OmniSharp_highlight_groups = {
    EnumMemberName = 'Identifier',
    ClassName = 'TSType',
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
      ['<leader>u'] = '<Plug>(omnisharp_find_usages)',
      ['<leader>D'] = '<Plug>(omnisharp_go_to_definition)',
      ['<leader>i'] = '<Plug>(omnisharp_find_implementations)',
      ['<leader>r'] = '<Plug>(omnisharp_rename)',
      ['<leader>a'] = '<Plug>(omnisharp_code_actions)',
      ['<leader>f'] = '<Plug>(omnisharp_code_format)',
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

  -- setup integration with nvim-cmp and cmp-omni
  local cmp_installed, cmp = pcall(require, 'cmp')
  local cmp_omni_installed = pcall(require, 'cmp_omni')

  if cmp_installed and cmp_omni_installed then
    local types = require('cmp.types')
    local omni_to_lsp_map = {
      Parameter = 'Variable',
      Structure = 'Struct',
      Const = 'Constant',
      Namespace = 'Unit',
      Delegate = 'Class',
      EnumMember = 'Constant'
    }

    local function normalize_kind(omni_kind)
      omni_kind = omni_to_lsp_map[omni_kind] or omni_kind
      local lsp_kind = types.lsp.CompletionItemKind[omni_kind] or types.lsp.CompletionItemKind.Text
      return types.lsp.CompletionItemKind[lsp_kind]
    end

    cmp.setup.filetype('cs', {
      sources = {
        { name = 'omni', trigger_characters = { '.' } }
      },
      formatting = {
        format = function(entry, vim_item)
          local details = entry.completion_item.labelDetails
          local lsp_kind = normalize_kind(details.detail)

          vim_item.kind = details.detail
          vim_item.kind_hl_group = 'CmpItemKind' .. lsp_kind
          vim_item.menu = details.description

          return vim_item
        end
      }
    })
  end
end

return M
