
require 'rake'

namespace :gem do
  desc "Install the gem locally"
  task :install do
    puts "Building gem"
    `gem build catchpoint.gemspec`
    puts "Installing gem"
    `sudo gem install ./catchpoint-*.gem`
    puts "Removing built gem"
    `rm catchpoint-*.gem`
  end

  desc "Push gem upstream"
  task :push do
    version = `awk -F \\\" ' /version/ { print $2 } ' catchpoint.gemspec`
    version.chomp!
    puts "Building catchpoint gem"
    system "gem build catchpoint.gemspec"
    puts "Pushing catchpoint gem version: #{version}"
    system "gem push catchpoint-#{version}.gem"
    puts "Cleaning up catchpoint-#{version}.gem"
    File.delete "catchpoint-#{version}.gem"
    # To yank:
    #gem yank catchpoint -v ${VERSION}
  end
end

namespace :git do
  desc "make a git tag"
  task :tag do
    version = `awk -F \\\" ' /version/ { print $2 } ' catchpoint.gemspec`
    version.chomp!
    puts "Tagging git with version=#{version}"
    system "git tag #{version}"
    system "git push --tags"
  end
end

