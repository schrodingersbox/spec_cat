require 'rspec'

require 'require_all'
require_rel 'spec_cat/matchers'

require 'spec_cat/railtie' if defined?(Rails)

module SpecCat

  def self.accept?
    !ENV[ 'SPEC_CAT_ACCEPT' ].nil?
  end

  def self.write( path, content )
    File.open( path, 'wb' ) { |io| io.write content }
  end

  def self.read( path )
    File.open( path, 'rb', &:read )
  end
end
