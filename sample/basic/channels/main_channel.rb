class MainChannel < Banjo::Channel
  def channel
    0
  end

  def perform
    # Twinkle, twinkle, little star
    # tick_note 0, 36 # C
    # tick_note 4, 38 # D
    # tick_note 8, 40 # E
    # tick_note 12, 41 # F
    # tick_note 16, 43 # G
    # tick_note 20, 45 # A
    # tick_note 24, 47 # B
    # tick_note 28, 48 # C

    play(36).at(0)
    play(36).at(8)

    play(43).at(16)
    play(43).at(24)

    play(45).at(32)
    play(45).at(40)

    play(43).at(48)

    play(41).at(64)
    play(41).at(72)

    play(40).at(80)
    play(40).at(88)

    play(38).at(96)
    play(38).at(104)

    play(36).at(112)


    #
    # Will play note 36 on every tick divisible by 4
    # with a 0 offset and velocity of 40
    #
    play(36).every(4)
  end
end
