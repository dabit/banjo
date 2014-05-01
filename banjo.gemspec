# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'banjo/version'

Gem::Specification.new do |spec|
  spec.name          = "banjo"
  spec.version       = Banjo::VERSION
  spec.authors       = ["David Padilla"]
  spec.email         = ["david@crowdint.com"]
  spec.description   = %q{MIDI looper designed for live performances}
  spec.summary       = %q{MIDI looper designed for live performances}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/) - Dir['sample/**/**'].to_a
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "unimidi", "0.3.3"
  spec.add_dependency "eventmachine", "~> 1.0.3"
  spec.add_dependency "rubysl-yaml", "2.0.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rr"
  spec.add_development_dependency "simplecov"
end
