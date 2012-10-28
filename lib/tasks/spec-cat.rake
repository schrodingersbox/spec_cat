namespace :'spec-cat' do

  desc 'Run rspec and accept all ground truth file changes'
  task :accept do
    Kernel.system 'SPEC_CAT_ACCEPT=1 rspec spec'
  end

  desc 'Run rspec with coverage and open the report'
  task :coverage do
    Kernel.system 'rspec spec && open coverage/index.html'
  end

end
