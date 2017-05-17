describe SpecCat do

  before( :each ) do
    @path = 'spec/data/truth.txt'
    @truth = 'This statement is false'
  end

  describe '::accept?' do

    it 'returns true if SPEC_CAT_ACCEPT is set in the environment' do
      ENV[ 'SPEC_CAT_ACCEPT' ] = '1'
      expect( SpecCat.accept? ).to be( true )
    end

    it 'returns false if SPEC_CAT_ACCEPT is not set in the environment' do
      ENV[ 'SPEC_CAT_ACCEPT' ] = nil
      expect( SpecCat.accept? ).to be( false )
    end

  end

  describe '::write' do

    it 'writes a file' do
      tmp = @path + '.tmp'
      File.delete( tmp ) if File.exists?( tmp )

      expect( File.exists?( tmp ) ).to be( false )
      SpecCat.write( tmp, @truth )
      expect( File.exists?( tmp ) ).to be( true )
    end

  end

  describe '::read' do

    it 'reads a file' do
      expect( SpecCat.read( @path ) ).to eql( @truth )
    end

  end

end