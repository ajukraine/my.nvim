return function()
  local lspconfig = require 'lspconfig'
  local configs = require 'lspconfig.configs'

  if not configs.fsharp then
    configs.fsharp = {
      default_config = {
        cmd = { 'dotnet', '/Users/bohdanmakohin/dev/fsharp-language-server/src/FSharpLanguageServer/bin/Release/net6.0/FSharpLanguageServer.dll' },
        filetypes = { 'fsharp' },
        root_dir = lspconfig.util.root_pattern('*.fsproj', '.git')
      }
    }
  end

  lspconfig.fsharp.setup { }
end
