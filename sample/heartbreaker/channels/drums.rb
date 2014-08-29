class Drums < Banjo::Channel
  def channel
    2
  end

  def perform
    play(c(1)).every(8)
    play(e(1)).every(8, 4)
    play(e(1)).at(26)

    play(as(1)).at(10)
    play(as(1)).at(14)

    play(as(1)).at(42)
    play(as(1)).at(46)
  end
end
