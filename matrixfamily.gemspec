# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'matrixfamily/version'

Gem::Specification.new do |spec|
  spec.name          = "matrixfamily"
  spec.version       = Matrixfamily::VERSION
  spec.authors       = ["Daniel Mateos"]
  spec.email         = ["alu0100635836@ull.edu.es"]
  spec.description   = %q{Gema para el uso de matrices densas y dispersas}
  spec.summary       = %q{Representación de matrices densas y dispersas}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end