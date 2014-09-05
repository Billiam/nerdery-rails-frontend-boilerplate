Rake::Task['assets:precompile'].clear

namespace :assets do
  task :precompile do
    puts %x(cd #{Rails.root.join('scripts/js')} && grunt build)
  end
end

