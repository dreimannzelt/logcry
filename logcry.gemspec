# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'logcry/version'

Gem::Specification.new do |spec|
  spec.name          = "logcry"
  spec.version       = Logcry::VERSION
  spec.authors       = ["we5"]
  spec.email         = ["bjoern@we5.de"]
  spec.description   = %q{Logcry gives you two nifty methods to log to your default rails logger just by providing a hash with some values which are transformed into a single line}
  spec.summary       = %q{Just cry your infos into the log files}
  spec.homepage      = "http://github.com/dreimannzelt/logcry"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
