class Bass < Banjo::Channel
  def channel
    2
  end

  def perform
    modulation 90
    bass_line
  end

  def bass_line
    $chord = 0 unless $chord
    if Banjo.tick == 0
      if $chord == 3
        $chord = 0
      else
        $chord += 1
      end
    end
    chords = [c(2), d(2), ds(2), c(2)]
    play(chords[$chord]).every(2)
  end
end
