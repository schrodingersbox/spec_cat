require 'spec-cat'
require 'rails'

module SpecCat
  class Railtie < Rails::Railtie
    railtie_name :spec_cat

    rake_tasks do
      load "tasks/spec-cat.rake"
    end
  end
end
