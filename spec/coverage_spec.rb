require 'spec_helper.rb'

describe 'coverage' do

  it 'has a spec for every file' do
    Dir.glob( File.join( 'lib', '{spec-cat,tasks}', '**', '*.{rb,rake}' ) ) do |path|
      path.should have_a_spec
    end
  end

end