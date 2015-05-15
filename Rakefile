require 'bundler'
require 'coveralls/rake/task'
require 'rspec/core/rake_task'
require 'rake/testtask'

Bundler::GemHelper.install_tasks

Coveralls::RakeTask.new

desc 'Run all specs'
RSpec::Core::RakeTask.new(:spec)

desc 'Run all Test::Unit tests'
Rake::TestTask.new do |t|
  t.libs << "test"
  t.libs << "."
  t.test_files = FileList['test/test*.rb', 'test/legacy/test*.rb']
  t.verbose = true
  t.warning = true
end

desc 'Default: run all tests and push coverage info to Coveralls'
task :default => [:spec, :test, 'coveralls:push']
