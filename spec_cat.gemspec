$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')

# Maintain your gem's version:
require 'spec_cat/version'
require 'date'

Gem::Specification.new do |s|
  s.name        = 'spec_cat'
  s.version     = SpecCat::VERSION
  s.date        = Date.today.to_s
  s.licenses    = ['MIT']
  s.summary     = 'RSpec support library'
  s.description = 'Adds a few useful RSpec matchers'
  s.authors     = ['Rich Humphrey']
  s.email       = 'rich@schrodingersbox.com'
  s.files       = Dir['lib/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.md']
  s.homepage    = 'https://github.com/schrodingersbox/spec_cat'
  s.require_path = ['lib']

  s.add_dependency 'rspec', '~> 3.0', '>= 3.0.0'
  s.add_dependency 'rubocop', '~> 0'
  s.add_dependency 'require_all'

  s.add_development_dependency 'rails', '~> 5.0', '>= 5.0.0'
  s.add_development_dependency 'simplecov', '~> 0'
  s.add_development_dependency 'coveralls', '~> 0'
end
