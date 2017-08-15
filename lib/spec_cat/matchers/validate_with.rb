# From https://gist.github.com/Bartuz/98abc9301adbc883b510
#
# RSpec matcher for validates_with.
# https://gist.github.com/2032846
# Usage:
#
#     describe User do
#       it { should validate_with CustomValidator }
#     end

RSpec::Matchers.define :validate_with do |expected_validator|

  match do |subject|
    @validator = subject.class.validators.find do |validator|
      validator.class == expected_validator
    end
    @validator.present? && options_matching?
  end

  def options_matching?
    if @options.present?
      @options.all? { |option| @validator.options[option] == @options[option] }
    else
      true
    end
  end

  def options_message
    @options.present? ? (' with options ' + @options.to_s) : ''
  end

  chain :with_options do |options|
    @options = options
  end

  description do
    "validates with #{expected}"
  end

  failure_message do
    "expected to validate with #{expected}#{options_message}"
  end

  failure_message_when_negated do
    "expected to not validate with #{expected}#{options_message}"
  end
end
