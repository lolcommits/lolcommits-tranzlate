require "bundler/gem_tasks"
require "rake/testtask"
require "rdoc/task"

# generate docs
RDoc::Task.new do |rd|
  rd.main     = "README.md"
  rd.title    = "Lolcommits Tranzlate"
  rd.rdoc_dir = "doc"
  rd.options  << "--all"
  rd.rdoc_files.include("README.md", "LICENSE", "lib/**/*.rb")
end

# run tests
Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

# run tests with code coverage (default)
namespace :test do
  desc "Run all tests and features and generate a code coverage report"
  task :coverage do
    ENV['COVERAGE'] = 'true'
    Rake::Task['test'].execute
  end
end


task :default => ['test:coverage']
