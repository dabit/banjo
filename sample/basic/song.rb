require 'bundler'
Bundler.require

Banjo.load_channels
Banjo.tempo = 100.0
Banjo.ticks_per_period = 32
Banjo.play
