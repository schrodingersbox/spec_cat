describe 'coverage' do

  Dir.glob( File.join( 'lib', '**', '*.{rb,rake}' ) ) do |path|
    it "has a spec for #{path}" do
      expect( path ).to have_a_spec
    end
  end

end