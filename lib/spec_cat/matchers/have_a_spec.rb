# have_a_spec.rb
#
# Confirms that a given file path has a corresponding spec file.

RSpec::Matchers.define :have_a_spec do

  description do
    'has a spec file'
  end

  match do |path|
    File.exist?( spec_file_for( path ) )
  end

  failure_message do |path|
    "expected #{path} to have spec at #{spec_file_for( path )}"
  end

  failure_message_when_negated do |path|
    "expected #{path} to not have spec at #{spec_file_for( path )}"
  end

  def spec_file_for( path )
    basename = File.basename( path, '.rb' ) + '_spec.rb'

    dirname = File.dirname( path )
    dirname.gsub!( /^app/, 'spec' )
    dirname.gsub!( /^lib/, 'spec/lib' )

    return File.join( dirname, basename )
  end
end
