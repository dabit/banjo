require 'test_helper'

class ChannelTest < Test::Unit::TestCase
  def channel
    @channel ||= Banjo::Channel.new
  end

  def test_inherited
    klass = Class.new(Banjo::Channel)
    assert_includes Banjo::Channel.channels, klass
  end

  def test_channel
    assert_equal 0, channel.channel
  end

  def test_play
    note = channel.play(22)
    assert_equal 22, note.note
    assert_equal channel, note.channel
    assert_kind_of Banjo::Note, note
  end

  def test_within_plays
    Banjo.tick = 1
    called = false
    channel.within(0, 2) do
      called = true
    end

    assert called, "Given block should be called"
  end

  def test_within_does_not_play
    Banjo.tick = 1
    called = true
    channel.within(10, 20) do
      called = false
    end

    assert called, "Given block should not be called"
  end

  def test_midi_messages
    assert_equal [0x90, 0x80], channel.midi_messages
  end

  def test_channels
    assert_equal [], Banjo::Channel.channels
  end

  def test_modulation
    channel.output = stub!
    mock(channel.output).puts(0xB0, 0x01, 100)
    channel.modulation(100)
  end

  def test_pitch
    channel.output = stub!
    mock(channel.output).puts(0xE0, 0, 100)
    channel.pitch(100)
  end

  def test_sustain
    channel.output = stub!
    mock(channel.output).puts(0xB0, 0x40, 100)
    channel.sustain(100)
  end

  def test_stfu
    channel.output = stub!
    mock(channel.output).puts(0xB0, 0x7B, 0)
    channel.stfu
  end
end
