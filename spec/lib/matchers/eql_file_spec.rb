require 'spec_helper.rb'

describe RSpec::Matchers, 'eql_file' do

  TRUTH = 'spec/truth/think.txt'
  LIE = 'All humanoid primates are created equal'

  before( :all ) do
    @truth = File.open( TRUTH, 'rb' ) {|io| io.read }
  end

  it 'passes for a file that matches' do
    @truth.should eql_file( TRUTH )
  end

  it 'fails for a file that is different' do
    LIE.should_not eql_file( TRUTH )
  end

  it 'writes a tmp file that will pass' do
    tmpfile = TRUTH + '.tmp'
    File.delete( tmpfile ) if File.exists?( tmpfile )
    File.exists?( tmpfile ).should be_false
    @truth.should eql_file( TRUTH )
    File.exists?( tmpfile ).should be_true
  end

end