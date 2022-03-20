DEBUG = true

require('packer_bootstrap')

local ok, impatient = pcall(require, 'impatient')
if ok and DEBUG then
  impatient.enable_profile()
end

require('options')
require('packer_config')
require('mappings')

