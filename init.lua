DEBUG = true

if DEBUG then
  vim.cmd [[set packpath?]]
  vim.cmd [[set rtp?]]
end

function _G.P(v)
  print(vim.inspect(v))
  return v
end

local ok, impatient = pcall(require, 'impatient')
if ok and DEBUG then
  impatient.enable_profile()
end

require('options')
require('mappings')

require('packer_bootstrap')
require('packer_config')

