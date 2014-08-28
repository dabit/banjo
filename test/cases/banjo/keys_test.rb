require 'test_helper'

class KeysTest < Test::Unit::TestCase
  def channel
    @channel ||= Banjo::Channel.new
  end

  def test_c_scale_0_key
    assert_equal 24, channel.c(0)
  end

  def test_c_key
    assert_equal 60, channel.c
  end

  def test_cs_key
    assert_equal 61, channel.cs
  end

  def test_b_key
    assert_equal 71, channel.b
  end
end

