# eql_file.rb
#
# Confirms that an in-memory string matches a ground truth file.
# Exports the actual value as a .tmp file as a side effect.
# 'cp foo/bar.tmp foo/bar' to correct valid test failures.
################################################################################

RSpec::Matchers.define :eql_file do |expected|

  description do
    "match the contents of #{expected}"
  end

  match do |actual|
    File.open( "#{expected}.tmp",'wb' ) { |io| io.write actual }
    slurped = File.open( "#{expected}", 'rb' ) {|io| io.read }
    actual == slurped
  end

  failure_message_for_should do |actual|
    "expected that #{actual} would match the contents of #{expected}"
  end

  failure_message_for_should_not do |actual|
    "expected that #{actual} would not match the contents of #{expected}"
  end

end
