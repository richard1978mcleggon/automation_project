require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

# Cucumber::Rake::Task.new(:features) do |t|
#   t.profile = 'default'
# end

Dir.chdir('/automation_project') do
  puts "Features directory:  #{Dir.pwd}"
  Cucumber::Rake::Task.new(:desktop_integration) do |t|
    t.profile = 'desktop_site'
    t.cucumber_opts = "--tags @sign_in --format pretty URL=#{ENV['URL']} BROWSER=#{ENV['BROWSER']}"
    #t.cucumber_opts = "features --format pretty URL=#{ENV['URL']} BROWSER=#{ENV['BROWSER']}"
  end
end

Dir.chdir('/automation_project') do
  puts "Features directory:  #{Dir.pwd}"
  Cucumber::Rake::Task.new(:desktop_integration_ext1) do |t|
    t.profile = 'desktop_site'
    t.cucumber_opts = "--tags @sign_in --format pretty URL=http://www.indeed.com BROWSER=firefox"
  end
  Rake::Task[:desktop_integration_ext1].invoke  #need to use for jenkins execution
end

Dir.chdir('/automation_project') do
  puts "Features directory:  #{Dir.pwd}"
  Cucumber::Rake::Task.new(:desktop_integration_ext2) do |t|
    t.profile = 'desktop_site'
    t.cucumber_opts = "--tags @regression --format pretty URL=http://www.indeed.com BROWSER=firefox"
  end
  Rake::Task[:desktop_integration_ext2].invoke  #need to use for jenkins execution
end

task :default => :integration

desc "compiling the application"
task :compile do

  puts "compiling task"

end

desc "running unit test"
task :unit_test => [:compile] do

  #sh("notepad.exe")
  puts "run unit task"

end

namespace :linux do

  task :unit_test do

    #sh("notepad.exe")
    puts "run unit task in linux"

  end

end

task :show_current_directory do

  puts "PWD = #{pwd}"

end