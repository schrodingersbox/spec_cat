require 'spec_helper'
require 'rake'

describe 'spec-cat rake tasks' do

  before( :each ) do
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake::Task.define_task(:environment)
    load 'lib/tasks/spec-cat.rake'
  end

  describe 'rake spec_cat:coverage' do

    it 'runs specs and opens the coverage report' do
      Kernel.should_receive( :system ).with( 'rspec spec && open coverage/index.html' )
      @rake[ 'spec_cat:coverage' ].invoke
    end

  end

end