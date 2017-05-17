# include_module.rb
#
# Confirms that the subject includes the expected module

RSpec::Matchers.define :include_module do |expected_module|

  description do
    "includes #{expected}"
  end

  failure_message do |subject|
    "expected that #{subject.class} would include #{expected}"
  end

  failure_message_when_negated do |subject|
    "expected that #{subject.class} would not include #{expected}"
  end

  match do |subject|
    subject.class.included_modules.include?( expected_module )
  end
end
