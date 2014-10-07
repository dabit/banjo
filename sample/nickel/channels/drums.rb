class Drums < Banjo::Channel
  def channel
    1
  end

  def perform
    play(c(1)).every(4)
    play(f(1)).every(8, 4)
    play(d(2)).every(2)
    play(e(2)).every(6)
  end
end
