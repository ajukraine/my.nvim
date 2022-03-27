local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})

  if packer_bootstrap then
    vim.api.nvim_command 'packadd packer.nvim'
  end
end

-- return require('packer').startup(function(use)
--   -- My plugins here
--   -- use 'foo1/bar1.nvim'
--   -- use 'foo2/bar2.nvim'

--   -- Automatically set up your configuration after cloning packer.nvim
--   -- Put this at the end after all plugins
--   if packer_bootstrap then
--     require('packer').sync()
--   end
-- end)
