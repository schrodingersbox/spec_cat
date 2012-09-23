$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')

# Maintain your gem's version:
require "spec-cat/version"

Gem::Specification.new do |s|
  s.name        = 'spec-cat'
  s.version     = SpecCat::VERSION
  s.date        = '2012-09-16'
  s.summary     = 'RSpec support library'
  s.description = 'Adds a few useful matchers'
  s.authors     = ['Rich Humphrey']
  s.email       = 'rich@schrodingersbox.com'
  s.files       = Dir['lib/**/*'] + ['LICENSE', 'README.md']
  s.homepage    = 'https://github.com/schrodingersbox/spec-cat'
  s.require_path = ['lib']

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'simplecov'
end

