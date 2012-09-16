$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')

Gem::Specification.new do |s|
  s.name        = 'spec-cat'
  s.version     = '0.0.1'
  s.date        = '2012-09-16'
  s.summary     = 'cat'
  s.description = 'RSpec support library'
  s.authors     = ['Rich Humphrey' ]
  s.email       = 'rich@schrodingersbox.com'
  s.files       = [
      'lib/matchers/eql_file.rb',
      'lib/matchers/have_a_spec.rb',
      'lib/spec-cat.rb',
  ]
  s.homepage    = 'http://rubygems.org/gems/spec-cat'
  s.require_path = ['lib']

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'simplecov'
end

