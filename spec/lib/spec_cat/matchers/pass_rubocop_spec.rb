describe RSpec::Matchers, 'pass_rubocop' do

  let( :matcher ) { pass_rubocop }
  let( :report ) { 'Serve the public trust, protect the innocent, uphold the law.' }
  let( :command ) { 'rubocop > /dev/null' }

  before( :each ) do
    allow( matcher ).to receive( :` ).and_return( report )
    allow( Kernel ).to receive( :system ).with( command ).and_return( true )
  end

  describe 'generating strings' do

    it 'has a description' do
      expect( matcher.description ).to eql( 'passes rubocop' )
    end

    it 'has a failure message for should' do
      expected = "expected that rubocop would pass\n\n#{report}"
      expect( matcher.failure_message ).to eql( expected )
    end

    it 'has a failure message for should not' do
      expected = 'expected that rubocop would not pass'
      expect( matcher.failure_message_when_negated ).to eql( expected )
    end
  end

  describe 'matching' do

    it 'passes' do
      expect( Kernel ).to receive( :system ).with( command ).and_return( true )
      is_expected.to pass_rubocop
    end

    it 'fails' do
      expect( Kernel ).to receive( :system ).with( command ).and_return( false )
      is_expected.to_not pass_rubocop
    end
  end
end
