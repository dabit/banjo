require 'test_helper'

class BanjoTest < Test::Unit::TestCase
  def test_load_channels
    Banjo.load_channels
    assert @@loaded, "channels/load_test.rb could not be loaded"
  end
end
