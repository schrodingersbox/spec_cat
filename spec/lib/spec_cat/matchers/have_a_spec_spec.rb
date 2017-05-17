describe RSpec::Matchers, 'have_a_spec' do

  let( :matcher ) { have_a_spec }
  let( :good_path ) { 'lib/spec_cat/matchers/have_a_spec.rb' }
  let( :bad_path ) { 'foo/bar.rb' }

  describe 'generating strings' do

    it 'has a description' do
      expect( matcher.description ).to eql( 'has a spec file' )
    end

    it 'has a failure message for should' do
      matcher.instance_variable_set( :@actual, bad_path )

      spec_path = matcher.spec_file_for( bad_path )
      expected = "expected #{bad_path} to have spec at #{spec_path}"
      expect( matcher.failure_message ).to eql( expected )
    end

    it 'has a failure message for should not' do
      matcher.instance_variable_set( :@actual, good_path )

      spec_path = matcher.spec_file_for( good_path )
      expected = "expected #{good_path} to not have spec at #{spec_path}"
      expect( matcher.failure_message_when_negated ).to eql( expected )
    end
  end

  describe 'matching' do

    it 'has a spec for itself' do
      expect( good_path ).to have_a_spec
    end

    it 'does not have a spec for foo/bar.rb' do
      expect( bad_path ).to_not have_a_spec
    end
  end
end
