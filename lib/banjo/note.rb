module Banjo
  class Note
    attr_accessor :channel, :note, :velocity, :duration

    def initialize(channel, note)
      self.channel  = channel
      self.note     = note
      self.velocity = 100
      self.duration = 0.5
    end

    def at(tick)
      play if Banjo.tick == tick
    end

    def every(period, offset = 0)
      play if ((Banjo.tick + offset) % period == 0)
    end

    def with_velocity(velocity)
      self.velocity = velocity
      self
    end

    def for(duration)
      self.duration = duration
      self
    end

    def play
      channel.play_note!(note, velocity, duration)
    end
  end
end
