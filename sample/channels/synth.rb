class Synth < Banjo::Channel
  def channel
    1
  end

  def perform
    mod_note(4, 55)
    mod_note(4, 57, 2)
    mod_note(6, 74, 2)
  end
end
