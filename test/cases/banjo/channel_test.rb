require 'test_helper'

class ChannelTest < Test::Unit::TestCase
  def subject
    @subject ||= Banjo::Channel.new
  end

  def test_channel
    assert_equal 0, subject.channel
  end

  def test_tick_note_plays
    Banjo.tick = 0
    mock(subject).play_note(15, 50, 0.5)
    subject.tick_note(0, 15)
  end

  def test_tick_note_does_not_play
    mock(subject).play_note(15, 50, 0.5).never
    subject.tick_note(3, 15)
  end

  def test_mod_note_when_note_plays
    [0, 4, 8, 12].each do |tick|
      Banjo.tick = tick
      mock(subject).play_note(15, 50, 0.5)
      subject.mod_note(4, 15)
    end
  end

  def test_mod_note_when_note_does_not_play
    ((0..15).to_a - [0, 4, 8, 12]).each do |tick|
      Banjo.tick = tick
      mock(subject).play_note(15, 50, 0.5).never
      subject.mod_note(4, 15)
    end
  end
end
