require 'spec_cat/railtie'

describe 'railtie' do

  it 'names itself spec_cat' do
    expect( SpecCat::Railtie.railtie_name ).to eql( 'spec_cat' )
  end

  it 'loads rake tasks' do
    rake_tasks = SpecCat::Railtie.instance_variable_get( :@rake_tasks )
    expect( rake_tasks ).to_not be_nil
    expect( rake_tasks.size ).to be( 1 )

    expect( SpecCat::Railtie ).to receive( :load ).with( 'tasks/spec_cat.rake' )
    rake_tasks.first.call
  end
end
