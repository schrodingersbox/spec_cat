require 'spec_helper.rb'

module IncludeModulePass
end

module IncludeModuleFail
end

class IncludeModuleTestClass
  include IncludeModulePass
end

describe RSpec::Matchers, 'include_module' do

  before( :each ) do
    @matcher = include_module
    @module = IncludeModulePass
    @class = IncludeModuleTestClass
  end

  it 'has a description' do
    @matcher.instance_variable_set( :@expected, @module )
    @matcher.description.should eql( "includes #{@module}" )
  end

  it 'has a failure message for should' do
    expected = "expected that #{@class} would include #{@module}"

    @matcher.instance_variable_set( :@expected, @module )
    @matcher.instance_variable_set( :@actual, @class )
    @matcher.failure_message_for_should.should eql( expected )
  end

  it 'has a failure message for should not' do
    expected =  "expected that #{@class} would not include #{@module}"

    @matcher.instance_variable_set( :@expected, @module )
    @matcher.instance_variable_set( :@actual, @class )
    @matcher.failure_message_for_should_not.should eql( expected )
  end

  describe 'match' do

    it 'passes if the module is includes' do
      @class.should include_module( IncludeModulePass )
    end

    it 'fails if the module is not included' do
      @class.should_not include_module( IncludeModuleFail )
    end

  end

end