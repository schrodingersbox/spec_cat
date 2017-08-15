describe RSpec::Matchers, 'include_module' do

  module IncludeModulePass
  end

  module IncludeModuleFail
  end

  class IncludeModuleTestClass
    include IncludeModulePass
  end


  let( :matcher ) { include_module }
  let( :included ) { IncludeModulePass }
  let( :not_included ) { IncludeModuleFail }
  let( :klass ) { IncludeModuleTestClass }
  let( :instance ) { klass.new }

  describe 'generating strings' do

    before( :each ) do
      allow( matcher ).to receive( :expected ).and_return( included )
      matcher.instance_variable_set( :@actual, instance )
    end

    it 'has a description' do
      expect( matcher.description ).to eql( "includes #{included}" )
    end

    it 'has a failure message for should' do
      expected = "expected that #{klass} would include #{included}"
      expect( matcher.failure_message ).to eql( expected )
    end

    it 'has a failure message for should not' do
      expected = "expected that #{klass} would not include #{included}"
      expect( matcher.failure_message_when_negated ).to eql( expected )
    end
  end

  describe 'matching' do

    context 'with an instance' do

      it 'passes if the module is included' do
        expect( instance ).to include_module( included )
      end

      it 'fails if the module is not included' do
        expect( instance ).to_not include_module( not_included )
      end
    end

    context 'with a class' do

      it 'passes if the module is included' do
        expect( klass ).to include_module( included )
      end

      it 'fails if the module is not included' do
        expect( klass ).to_not include_module( not_included )
      end
    end
  end
end
