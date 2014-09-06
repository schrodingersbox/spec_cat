require 'spec_helper.rb'

require "spec_cat/version"

describe 'version' do

  it 'has a version constant' do
    expect( SpecCat::VERSION ).to_not be_nil
    expect( SpecCat::VERSION ).to be_an_instance_of( String )
    expect( SpecCat::VERSION ).to match( /\d+\.\d+\.\d+/ )
  end

end