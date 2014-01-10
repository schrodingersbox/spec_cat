# include_module.rb
#
# Confirms that the subject includes the expected module

RSpec::Matchers.define :include_module do |expected_module|

  description do
    "includes #{expected}"
  end

  failure_message_for_should do |actual|
    "expected that #{actual} would include #{expected}"
  end

  failure_message_for_should_not do |actual|
    "expected that #{actual} would not include #{expected}"
  end

  match do |actual|
    actual.included_modules.include?( expected_module )
  end

end
