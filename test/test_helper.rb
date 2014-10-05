require 'simplecov'

SimpleCov.start do
  add_filter 'test'
end

gem 'minitest', '4.7.5'

require 'test/unit'
require 'rr'

require 'banjo'
