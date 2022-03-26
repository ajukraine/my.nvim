return {
  config = function ()
    vim.g.nvim_tree_icons = {
      default = '',
      symlink = ''
    }

    require('nvim-tree').setup {
      update_cwd = true
    }
  end
}
