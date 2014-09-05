Rake::Task["spec"].enhance do
  Rake::Task["js:test"].invoke
end

namespace :js do
  task :test do
    puts %x(cd #{Rails.root.join('scripts/js')} && grunt test)
  end

  task :coverage do
    puts %x(cd #{Rails.root.join('scripts/js')} && grunt coverage)
  end
end