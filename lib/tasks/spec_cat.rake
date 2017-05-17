namespace :spec_cat do

  desc 'Run rspec and accept all ground truth file changes'
  task :accept do
    ENV[ 'SPEC_CAT_ACCEPT' ] = '1'
    Kernel.system 'rspec spec'
  end

  desc 'Run rspec with coverage and open the report'
  task :coverage do
    Kernel.system 'rspec spec && open coverage/index.html'
  end
end
