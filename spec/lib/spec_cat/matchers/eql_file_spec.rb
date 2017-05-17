describe RSpec::Matchers, 'eql_file' do

  let( :diff ) { 'diff goes here' }

  before( :each ) do
    @matcher = eql_file
    @path = 'spec/data/truth.txt'
    @truth = 'This statement is false'

    allow( SpecCat ).to receive( :accept? ).and_return( false )
  end

  it 'has a description' do
    allow( @matcher ).to receive( :expected ).and_return( @path )
    expect( @matcher.description ).to eql( "match the contents of #{@path}" )
  end

  it 'has a failure message for should' do
    expected = "expected that \"#{@truth}\" would match the contents of #{@path}\n\n#{diff}\n\n"

    allow( @matcher ).to receive( :expected ).and_return( @path )
    @matcher.instance_variable_set( :@actual, @truth )
    allow( @matcher ).to receive( :` ).and_return( diff )
    expect( @matcher.failure_message ).to eql( expected )
  end

  it 'has a failure message for should not' do
    expected = "expected that \"#{@truth}\" would not match the contents of #{@path}\n\n#{diff}\n\n"

    allow( @matcher ).to receive( :expected ).and_return( @path )
    @matcher.instance_variable_set( :@actual, @truth )
    allow( @matcher ).to receive( :` ).and_return( diff )
    expect( @matcher.failure_message_when_negated ).to eql( expected )
  end

  describe 'match' do

    it 'passes for a file that matches' do
      expect( @truth ).to eql_file( @path )
    end

    it 'fails for a file that is different' do
      expect( 'foobar' ).to_not eql_file( @path )
    end

    context 'accepting' do

      it 'overwrites the ground truth file' do
        expect( SpecCat ).to receive( :accept? ).and_return( true )
        expect( SpecCat ).to receive( :write ).with( @path, @truth )
        expect( @truth ).to eql_file( @path )
      end
    end

    context 'not accepting' do

      it 'writes a tmp file' do
        tmp = @path + '.tmp'
        File.delete( tmp ) if File.exist?( tmp )

        expect( File.exist?( tmp ) ).to be( false )
        expect( @truth ).to eql_file( @path )
        expect( File.exist?( tmp ) ).to be( true )
      end
    end
  end
end
