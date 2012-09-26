require 'spec_helper.rb'

describe RSpec::Matchers, 'have_a_spec' do

  before( :each ) do
    @matcher = have_a_spec
    @good_path = 'lib/spec-cat/matchers/have_a_spec.rb'
    @bad_path = 'foo/bar.rb'
  end

  it 'has a description' do
    @matcher.description.should eql( 'has a spec file' )
  end

  it 'has a failure message for should' do
    expected = "expected #{@bad_path} to have spec at #{have_a_spec.spec_file_for( @bad_path )}"

    @matcher.instance_variable_set( :@actual, @bad_path )
    @matcher.failure_message_for_should.should eql( expected )
  end

  it 'has a failure message for should not' do
     expected = "expected #{@good_path} to not have spec at #{have_a_spec.spec_file_for( @good_path )}"

    @matcher.instance_variable_set( :@actual, @good_path )
    @matcher.failure_message_for_should_not.should eql( expected )
  end

  it 'has a spec for itself' do
    @good_path.should have_a_spec
  end

  it 'does not have a spec for foo/bar.rb' do
    @bad_path.should_not have_a_spec
  end

end