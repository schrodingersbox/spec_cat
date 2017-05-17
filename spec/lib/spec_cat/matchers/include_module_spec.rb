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
    @subject = IncludeModuleTestClass.new
  end

  it 'has a description' do
    allow( @matcher ).to receive( :expected ).and_return( @module )
    expect( @matcher.description ).to eql( "includes #{@module}" )
  end

  it 'has a failure message for should' do
    expected = "expected that #{@subject.class} would include #{@module}"

    allow( @matcher ).to receive( :expected ).and_return( @module )
    @matcher.instance_variable_set( :@actual, @subject )
    expect( @matcher.failure_message ).to eql( expected )
  end

  it 'has a failure message for should not' do
    expected =  "expected that #{@subject.class} would not include #{@module}"

    allow( @matcher ).to receive( :expected ).and_return( @module )
    @matcher.instance_variable_set( :@actual, @subject )
    expect( @matcher.failure_message_when_negated ).to eql( expected )
  end

  describe 'match' do

    context 'with an instance' do

      it 'passes if the module is included' do
        expect( @subject ).to include_module( IncludeModulePass )
      end

      it 'fails if the module is not included' do
        expect( @subject ).to_not include_module( IncludeModuleFail )
      end
    end

    context 'with a class' do

      it 'passes if the module is included' do
        expect( IncludeModuleTestClass ).to include_module( IncludeModulePass )
      end

      it 'fails if the module is not included' do
        expect( IncludeModuleTestClass ).to_not include_module( IncludeModuleFail )
      end
   end
  end
end