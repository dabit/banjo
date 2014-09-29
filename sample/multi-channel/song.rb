require 'bundler'
Bundler.setup

require 'banjo'

Banjo.load_channels!
Banjo::Channel.channels.each do |c|
  c.new(0).hush
end
Banjo.tempo             = 110
Banjo.ticks_per_beat    = 8.0
Banjo.beats_per_measure = 4.0
Banjo.measures_per_loop = 1.0

Banjo.play
