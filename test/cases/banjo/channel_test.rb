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

  def test_midi_channels
    assert_equal [0x90, 0x80], channel.midi_channels
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

  def test_play_note
    channel.output = stub!
    channel.midi_channels.each do |key|
      mock(channel.output).puts(key, 40, 100)
    end
    mock(channel).sleep(0.5)

    channel.play_note!(40)
    channel.threads.each { |t| t.join }
  end
end
