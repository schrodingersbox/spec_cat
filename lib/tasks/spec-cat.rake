namespace :'spec-cat' do

  desc 'Run coverage and open the report'
  task :coverage do
    Kernel.system 'rspec spec && open coverage/index.html'
  end

end
