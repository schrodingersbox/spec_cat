require 'spec_helper.rb'

describe RSpec::Matchers, 'eql_file' do

  before( :each ) do
    @matcher = eql_file
    @path = 'spec/data/truth.txt'
    @truth = File.open( @path, 'rb' ) {|io| io.read }
  end

  it 'has a description' do
    @matcher.instance_variable_set( :@expected, @path )
    @matcher.description.should eql( "match the contents of #{@path}" )
  end

  it 'has a failure message for should' do
    expected = "expected that #{@truth} would match the contents of #{@path}"

    @matcher.instance_variable_set( :@expected, @path )
    @matcher.instance_variable_set( :@actual, @truth )
    @matcher.failure_message_for_should.should eql( expected )
  end

  it 'has a failure message for should not' do
    expected = "expected that #{@truth} would not match the contents of #{@path}"

    @matcher.instance_variable_set( :@expected, @path )
    @matcher.instance_variable_set( :@actual, @truth )
    @matcher.failure_message_for_should_not.should eql( expected )
  end

  it 'passes for a file that matches' do
    @truth.should eql_file( @path )
  end

  it 'fails for a file that is different' do
    'foobar'.should_not eql_file( @path )
  end

  it 'writes a tmp file that will pass' do
    tmp = @path + '.tmp'
    File.delete( tmp ) if File.exists?( tmp )

    File.exists?( tmp ).should be_false
    @truth.should eql_file( @path )
    File.exists?( tmp ).should be_true
  end

end