require('bootstrap')

local ok, impatient = pcall(require, 'impatient')
if ok then
  impatient.enable_profile()
end

require('options')
require('config')
require('mappings')

