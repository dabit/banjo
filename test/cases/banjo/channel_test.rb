require 'test_helper'

class ChannelTest < Test::Unit::TestCase
  def subject
    @subject ||= Banjo::Channel.new
  end

  def test_channel
    assert_equal 0, subject.channel
  end
end
