# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "scrubba/version"

Gem::Specification.new do |spec|
  spec.name          = "scrubba"
  spec.version       = Scrubba::VERSION
  spec.authors       = ["Jon-Michael Deldin"]
  spec.email         = ["dev@jmdeldin.com"]

  spec.summary       = "Strip and normalize strings for ActiveModel/ActiveAttr"
  spec.homepage      = "https://github.com/jmdeldin/scrubba"
  spec.license       = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^test/}) }
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "activemodel"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rubocop"
end
