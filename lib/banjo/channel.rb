module Banjo
  class Channel
    attr_accessor :output, :tick

    def channel
      0
    end

    def self.channels
      @channels ||= []
    end

    def self.inherited(child)
      channels << child
    end

    def initialize(tick)
      @output = UniMIDI::Output.all[channel]
      @tick   = tick
    end

    def tick_note(tick, note, velocity = 50, duration = 0.5)
      play_note(note, velocity, duration) if tick == self.tick
    end

    def mod_note(mod, note, offset = 0, velocity = 50)
      play_note(note, velocity, 0.5) if ((tick + offset) % mod == 0)
    end

    def play_note(note, velocity = 50, duration = 0.5)
      Thread.new { play_note!(note, velocity, duration) }
    end

    def arpeggio(notes, velocity = 50)
      step = (1.0 * Banjo.ticks_per_period / notes.size).round
      notes.each_with_index do |note, index|
        tick_note((index * step), note, velocity)
      end
    end

    def play_note!(note, velocity = 50, duration = 0.5)
      output.open do |o|
        o.puts(0x80, note, velocity)
        sleep(duration)
        o.puts(0x90, note, velocity)
      end
    end
  end
end
