require 'active_model'

describe RSpec::Matchers, 'validate_with' do

  class TestValidator  < ActiveModel::Validator
  end

  class UnvalidatedModel
    include ActiveModel::Model
  end

  class ValidatedModel
    include ActiveModel::Model
    validates_with TestValidator
  end

  let( :matcher ) { validate_with }
  let( :options ) { { test: true } }
  let( :unvalidated ) { UnvalidatedModel.new }
  let( :validated ) { ValidatedModel.new }
  let( :validator ) { TestValidator }

  describe 'generating strings' do

    before( :each ) do
      allow( matcher ).to receive( :expected ).and_return( validator )
      matcher.instance_variable_set( :@options, options )
    end

    it 'has a description' do
      expected = 'validates with TestValidator'
      expect( matcher.description ).to eql( expected )
    end

    it 'has a failure message for should' do
      expected = 'expected to validate with TestValidator with options {:test=>true}'
      expect( matcher.failure_message ).to eql( expected )
    end

    it 'has a failure message for should not' do
      expected = 'expected to not validate with TestValidator with options {:test=>true}'
      expect( matcher.failure_message_when_negated ).to eql( expected )
    end
  end

  describe 'matching' do

    it 'passes if the model is validated' do
      expect( validated ).to validate_with( validator )
    end

    it 'fails if the model is not validated' do
      expect( unvalidated ).to_not validate_with( validator )
    end
  end
end
