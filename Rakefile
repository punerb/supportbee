#!/usr/bin/env rake
require "bundler/gem_tasks"

require 'rake'
require 'rake/testtask'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new('spec')
task :default => :spec

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
end
