
# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aamva/version'

Gem::Specification.new do |spec|
  spec.name          = 'aamva'
  spec.version       = AAMVA::VERSION
  spec.authors       = ['Kyle Decot']
  spec.email         = ['kyle@joinroot.com']

  spec.summary       = 'Write a short summary, because Rubygems requires one.'
  spec.description   = 'Write a longer description or delete this line.'
  spec.homepage      = 'https://github.com/kyledecot/aamva'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faker'
  spec.add_dependency 'gli', '~> 2.16'
  spec.add_dependency 'pdf417', '~> 1.0.0'
  spec.add_dependency 'chunky_png', '~> 1.3.10'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'guard-rspec', '~> 4.7.3'
  spec.add_development_dependency 'pry', '~> 0.11.3'
  spec.add_development_dependency 'rake', '~> 12.3.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.49'
  spec.add_development_dependency 'simplecov', '~> 0.15.1'
end
