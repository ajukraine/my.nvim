return {
  config = function ()
    -- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
    -- or if the server is already installed).
    require("nvim-lsp-installer").on_server_ready(function(server)
      local opts = {}

      -- (optional) Customize the options passed to the server
      -- if server.name == "tsserver" then
      --     opts.root_dir = function() ... end
      -- end

      if server.name == 'sumneko_lua' then
        -- TODO: Implemented 'safe set' function to create deep nested configs in one go
        opts = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { 'vim' }
              }
            }
          }
        }
      end

      opts.on_attach = function (_, buffer_number)
        local key_opts = { noremap = true, buffer = buffer_number }

        vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, key_opts)
        vim.keymap.set('n', '<leader>lh', vim.lsp.buf.signature_help, key_opts)
        vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation, key_opts)
        vim.keymap.set('n', '<leader>lk', vim.lsp.buf.hover, key_opts)
      end

      -- This setup() function will take the provided server configuration and decorate it with the necessary properties
      -- before passing it onwards to lspconfig.
      -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
      server:setup(opts)
    end)
  end
}
