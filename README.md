[![Build Status](http://allthebadges.io/dabit/banjo/travis.png)](http://allthebadges.io/dabit/banjo/travis)
[![Code Climate](http://allthebadges.io/dabit/banjo/code_climate.png)](http://allthebadges.io/dabit/banjo/code_climate)

# Banjo

MIDI Looper designed for Live performances

## Installation

Install it:

    $ gem install banjo

## Requirements

### Mac OS X

You need to create virtual MIDI IAC inputs.

Open Audio Midi Setup

![](http://monosnap.com/image/u5lWy0g41Qt2JnjJqFp1nPExF9aIK9.png)

Then on the Window Menu click on Show MIDI Window

![](http://monosnap.com/image/TswtEsSbER5dKiB7gLoxEzjptzzjzy.png)

Double Click the IAC Driver icon and press the + where it says Ports, you should
see something like this:

![](http://monosnap.com/image/D8wQ6wC2SPvhW2fW7f3qjznlUrUV4J.png)

Each one of these inputs will work as a Channel for Banjo.

To make sure you have IAC inputs set up properly you can run the following
command:

    $ unimidi list

    input:
    0) Apple Inc. IAC Driver
    2) Apple Inc. IAC Driver
    4) Apple Inc. IAC Driver
    6) Apple Inc. IAC Driver
    output:
    1) Apple Inc. IAC Driver
    3) Apple Inc. IAC Driver
    5) Apple Inc. IAC Driver
    7) Apple Inc. IAC Driver

The `unimidi list` command will show you a list of the available IAC drivers
that can be used with Banjo.

## Usage

Promise to come back to write a proper guide, for now take a look at the included
sample.

After you create the IAC driver open Garage Band.

Go to the `sample/basic` folder and run:

    $ ruby song.rb

You should be able to listen some of the tones created by Banjo.

Edit `channels/main_channel.rb` on the `sample/basic` folder while the Banjo
reactor is running and you will notice the changes in realtime.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[1]:http://www.youtube.com/watch?v=hgFA_fdup7g
