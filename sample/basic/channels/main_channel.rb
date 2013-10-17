class MainChannel < Banjo::Channel
  def channel
    0
  end

  def perform
    # Will play note 32 at tick 0
    tick_note 0, 32
    # Will play note 44 at tick 4
    tick_note 4, 44
    # Will play note 41 at tick 8
    tick_note 8, 51

    #
    # Will play note 58 on every tick divisible by 2
    # with a 0 offset and velocity of 40
    #
    mod_note(2, 58, 0, 40)
  end
end
