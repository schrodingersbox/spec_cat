require 'spec_helper.rb'

require 'spec_cat/railtie'

describe 'railtie' do

  it 'names itself spec_cat' do
    SpecCat::Railtie.railtie_name.should eql( 'spec_cat' )
  end

  it 'loads rake tasks' do
    rake_tasks = SpecCat::Railtie.instance_variable_get( :@rake_tasks )
    rake_tasks.should_not be_nil
    rake_tasks.size.should be( 1 )

    SpecCat::Railtie.should_receive( :load ).with( 'tasks/spec_cat.rake' )
    rake_tasks.first.call
  end

end