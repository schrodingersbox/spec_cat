require 'spec_helper.rb'

describe RSpec::Matchers, 'have_a_spec' do

  it 'has a description' do
    have_a_spec.description.should eql( 'has a spec file' )
  end

  it 'has a spec for itself' do
    'lib/matchers/have_a_spec.rb'.should have_a_spec
  end

  it 'does not have a spec for foo/bar.rb' do
    'foo/bar.rb'.should_not have_a_spec
  end

  it 'has a spec for every Ruby file' do
    Dir.glob( File.join( 'lib', 'matchers', '**' ) ) do |path|
      next if File.directory?( path )
      path.should have_a_spec
    end
  end

end