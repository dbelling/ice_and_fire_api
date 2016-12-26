# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ice_and_fire_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'ice_and_fire_api'
  spec.version       = IceAndFireApi::VERSION
  spec.authors       = ['Dan Belling']
  spec.email         = ['danhbelling@gmail.com']

  spec.summary       = "All the data from the universe \
                        of Ice And Fire you've ever wanted"
  spec.description   = 'A wrapper gem for http://www.anapioficeandfire.com/api'
  spec.homepage      = 'https://github.com/dbelling/ice_and_fire_api'
  spec.license       = 'MIT'

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~>10.0'
  spec.add_development_dependency 'rspec', '~>3.0.0', '>=3.0.0'
  spec.add_development_dependency 'vcr', '~>3.0.0', '>=3.0.0'

  spec.add_dependency 'faraday', '~>0.9.2'
  spec.add_dependency 'json', '~>1.8.2', '>=1.8.2'

  spec.files         = `git ls-files`.split("\n")
  spec.bindir        = 'bin'
  spec.executables   = `git ls-files -- bin/*`
                       .split("\n").map { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
