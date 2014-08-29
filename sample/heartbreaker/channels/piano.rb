class Piano < Banjo::Channel
  def channel
    0
  end

  def perform
    modulation 0

    if true
      play(c(2)).for(2).at(0)
      play(gs(1)).for(1.5).at(14)
      play(a(1)).for(0.5).at(26)
      play(as(1)).for(2).at(30)
      play(c(2)).at(42)
      play(f(1)).for(2.3).at(46)
    end
  end
end
