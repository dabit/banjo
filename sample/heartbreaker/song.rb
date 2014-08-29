require 'bundler'
Bundler.require

Banjo.load_channels!
Banjo.tempo             = 130
Banjo.ticks_per_beat    = 4.0
Banjo.beats_per_measure = 4.0
Banjo.measures_per_loop = 4.0

Banjo.play
