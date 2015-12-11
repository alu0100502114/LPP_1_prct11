# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bibliografia/version'

Gem::Specification.new do |spec|
  spec.name          = "Bibliografia"
  spec.version       = Bibliografia::VERSION
  spec.authors       = ["alu0100502114"]
  spec.email         = ["alu0100502114@ull.edu.es"]

  spec.summary       = %q{Práctica 11 de LPP.}
  spec.description   = %q{Referencias en una Bibliografía en una Lista enlazada de doble entrada}
  spec.homepage      = "https://bitbucket.org/jesus_marin/lpp_1_prct11"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "coveralls"
end
