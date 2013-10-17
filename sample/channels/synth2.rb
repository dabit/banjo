class Synth2 < Banjo::Channel
  def channel
    2
  end

  def perform
    tick_note(0, 74, 100)
    tick_note(4, 78, 100)
    tick_note(6, 86, 100)
  end
end
