# pass_rubocop.rb
#
# Confirms that the working directory passes rubocop

RSpec::Matchers.define :pass_rubocop do

  description do
    'passes rubocop'
  end

  failure_message do
    report = `rubocop`
    "expected that rubocop would pass\n\n#{report}"
  end

  failure_message_when_negated do
    'expected that rubocop would not pass'
  end

  match do
    Kernel.system( 'rubocop > /dev/null' )
  end
end
