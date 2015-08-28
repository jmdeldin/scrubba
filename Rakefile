require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

task :style do
  sh "rubocop"
end

task :console do
  require "bundler/setup"
  require "pry"
  require "scrubba"
  Pry.start
end

task default: %i[style test]
