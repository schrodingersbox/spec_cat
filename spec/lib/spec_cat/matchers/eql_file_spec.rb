describe RSpec::Matchers, 'eql_file' do

  let( :matcher ) { eql_file }
  let( :diff ) { 'diff goes here' }
  let( :path ) { 'spec/data/truth.txt' }
  let( :truth ) { 'This statement is false' }

  before( :each ) do
    allow( SpecCat ).to receive( :accept? ).and_return( false )
    allow( matcher ).to receive( :` ).and_return( diff )
  end

  describe 'generating strings' do

    before( :each ) do
      allow( matcher ).to receive( :expected ).and_return( path )
      matcher.instance_variable_set( :@actual, truth )
    end

    it 'has a description' do
      expect( matcher.description ).to eql( "match the contents of #{path}" )
    end

    it 'has a failure message for should' do
      expected = "expected that \"#{truth}\" would match the contents of #{path}\n\n#{diff}\n\ncp .tmp \n\n"
      expect( matcher.failure_message ).to eql( expected )
    end

    it 'has a failure message for should not' do
      expected = "expected that \"#{truth}\" would not match the contents of #{path}\n\n#{diff}\n\n"
      expect( matcher.failure_message_when_negated ).to eql( expected )
    end
  end

  describe 'matching' do

    it 'passes for a file that matches' do
      expect( truth ).to eql_file( path )
    end

    it 'fails for a file that is different' do
      expect( 'foobar' ).to_not eql_file( path )
    end

    context 'accepting' do

      it 'overwrites the ground truth file' do
        expect( SpecCat ).to receive( :accept? ).and_return( true )
        expect( SpecCat ).to receive( :write ).with( path, truth )
        expect( truth ).to eql_file( path )
      end
    end

    context 'not accepting' do

      it 'writes a tmp file' do
        tmp = path + '.tmp'
        File.delete( tmp ) if File.exist?( tmp )

        expect( File.exist?( tmp ) ).to be( false )
        expect( truth ).to eql_file( path )
        expect( File.exist?( tmp ) ).to be( true )
      end
    end
  end
end
