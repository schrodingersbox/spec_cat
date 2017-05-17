require 'spec_cat'
require 'rails'

module SpecCat
  class Railtie < Rails::Railtie
    railtie_name :spec_cat

    rake_tasks do
      load 'tasks/spec_cat.rake'
    end
  end
end
