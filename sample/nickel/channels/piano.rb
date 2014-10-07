class Piano < Banjo::Channel
  def channel
    0
  end

  def perform
    #pitch(rand(127))

    play(e(3)).every(6)
    play(c(3)).every(3)
    play(c(4)).every(2)
  end
end
