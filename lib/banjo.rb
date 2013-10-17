require 'banjo/version'

require 'eventmachine'
require 'unimidi'

require 'banjo/channel'

$: << '.'

module Banjo
  class << self
    attr_accessor :tempo
  end

  def self.load_channels
    Dir['./channels/*.rb'].each do |file|
      load file
    end
  end

  def self.play
    tempo_in_ms = 60.0 / Banjo.tempo / 16

    EventMachine.run do
      n = 0
      EM.add_periodic_timer(tempo_in_ms) do
        begin
          Banjo.load_channels
        end

        Banjo::Channel.channels.each do |klass|
          channel = klass.new(n)
          channel.perform
        end

        n < 15 ? n += 1 : n = 0
      end
    end
  end
end
