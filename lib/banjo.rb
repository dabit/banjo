require 'banjo/version'

require 'eventmachine'
require 'unimidi'

require 'banjo/keys'
require 'banjo/channel'
require 'banjo/note'

$: << '.'

module Banjo
  class << self
    attr_accessor :tick
    attr_accessor :beats_per_measure
    attr_accessor :measures_per_loop
    attr_accessor :tempo
    attr_accessor :ticks_per_beat
    attr_accessor :ticks_per_period
    attr_accessor :loop_count
  end

  def self.load_channels
    load_channels!
  rescue Exception
  end

  def self.load_channels!
    Dir['./channels/*.rb'].each do |file|
      load file
    end
  end

  def self.play
    Banjo.measures_per_loop ||= 1
    Banjo.ticks_per_period = Banjo.ticks_per_beat * Banjo.beats_per_measure * Banjo.measures_per_loop
    tempo_in_seconds = (60.0 / Banjo.tempo / Banjo.ticks_per_beat)
    puts "Tick every: #{tempo_in_seconds} seconds"

    EventMachine.run do
      Banjo.tick = 0
      self.loop_count = 0

      p Banjo::Channel.channels

      EM.add_periodic_timer(tempo_in_seconds) do
        puts Time.now if (Banjo.tick % 4 == 0)

        Banjo.load_channels if Banjo.tick == 0

        Banjo::Channel.channels.each do |klass|
          channel = klass.new
          channel.perform
        end

        Banjo.tick = update_counters(Banjo.tick)
      end

      puts "Banjo Reactor started..."
    end
  end

  def self.update_counters(tick)
    if tick < (ticks_per_period - 1)
      tick += 1
    else
      puts self.loop_count += 1
      tick = 0
    end
    tick
  end
end
