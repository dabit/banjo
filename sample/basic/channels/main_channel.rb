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

    tick_note 0, 36
    tick_note 8, 36

    tick_note 16, 43
    tick_note 24, 43

    tick_note 32, 45
    tick_note 40, 45

    tick_note 48, 43

    tick_note 64, 41
    tick_note 72, 41

    tick_note 80, 40
    tick_note 88, 40

    tick_note 96, 38
    tick_note 104, 38

    tick_note 112, 36

    #
    # Will play note 36 on every tick divisible by 4
    # with a 0 offset and velocity of 40
    #
    mod_note(4, 36, 0, 40)
    mod_note(8, 40)
    mod_note(12, 43)
    mod_note(16, 38)
    mod_note(32, 127, 0, 50)
    mod_note(124, 55)
  end
end
