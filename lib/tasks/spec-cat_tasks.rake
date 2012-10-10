namespace :spec_cat do

  desc 'Run coverage and open the report'
  task :coverage do
    system 'rspec spec && open coverage/index.html'
  end

end
