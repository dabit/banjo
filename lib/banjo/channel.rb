module Banjo
  class Channel
    include Banjo::Keys

    attr_accessor :output
    attr_accessor :threads

    DEFAULT_DURATION = 0.5

    def channel
      0
    end

    def play(note)
      Note.new(self, note)
    end

    def midi_channels
      [0x90, 0x80]
    end

    def self.channels
      @channels ||= []
    end

    def self.inherited(child)
      channels << child
    end

    def initialize
      @output = UniMIDI::Output.all[channel]
      self.threads = []
    end

    #def tick_notes(notes, velocity = 50, duration = DEFAULT_DURATION)
      #notes.each do |tick, note|
        #tick_note(tick, note, velocity, duration)
      #end
    #end

    def modulation(value = 0)
      output.puts 0xB0, 0x01, value
    end

    def pitch(value = 63)
      output.puts 0xE0, 0, value
    end

    def sustain(value = 0)
      output.puts 0xB0, 0x40, value
    end

    def arpeggio(notes, velocity = 50)
      step = (1.0 * Banjo.ticks_per_period / notes.size).round
      notes.each_with_index do |note, index|
        tick_note((index * step), note, velocity)
      end
    end

    def stfu
      output.puts 0xB0, 0x7B, 0
    end

    def play_note!(note, velocity = 100, duration = DEFAULT_DURATION)
      threads << Thread.new do
        output.puts(midi_channels[0], note, velocity)
        sleep(duration)
        output.puts(midi_channels[1], note, velocity)
      end
    end
  end
end
