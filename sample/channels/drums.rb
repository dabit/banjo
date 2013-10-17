class Drums < Banjo::Channel
  def channel
    0
  end

  def perform
    tick_note(0, 36)
    tick_note(8, 38)
    mod_note(2, 55)
  end
end
