require 'spec_helper.rb'

require "spec-cat/version"

describe 'version' do

  it 'has a version constant' do
    SpecCat::VERSION.should_not be_nil
    SpecCat::VERSION.should be_an_instance_of( String )
    SpecCat::VERSION.should =~ /\d+\.\d+\.\d+/
  end

end