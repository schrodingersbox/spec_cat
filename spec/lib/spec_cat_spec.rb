require 'spec_helper.rb'

describe SpecCat do

  before( :each ) do
    @path = 'spec/data/truth.txt'
    @truth = 'This statement is false'
  end

  describe '::accept?' do

    it 'returns true if SPEC_CAT_ACCEPT is set in the environment' do
      ENV[ 'SPEC_CAT_ACCEPT' ] = '1'
      SpecCat.accept?.should be_true
    end

    it 'returns false if SPEC_CAT_ACCEPT is not set in the environment' do
      ENV[ 'SPEC_CAT_ACCEPT' ] = nil
      SpecCat.accept?.should be_false
    end

  end

  describe '::write' do

    it 'writes a file' do
      tmp = @path + '.tmp'
      File.delete( tmp ) if File.exists?( tmp )

      File.exists?( tmp ).should be_false
      SpecCat.write( tmp, @truth )
      File.exists?( tmp ).should be_true
    end

  end

  describe '::read' do

    it 'reads a file' do
      SpecCat.read( @path ).should eql( @truth )
    end

  end

end