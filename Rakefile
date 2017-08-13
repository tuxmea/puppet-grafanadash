require 'puppetlabs_spec_helper/rake_tasks'
require 'rspec/core/rake_task'
require 'puppet'

# abort if puppet version is to old
if Puppet::version < '4'
  puts 'YOU MUST RUN THIS WITH PUPPET 4.x'
  abort
end

exclude_paths = %w(
  vendor/**/*
  spec/**/*
  pkg/**/*
  tests/**/*
)

# the default lint task can not override the pattern configuration
Rake::Task[:lint].clear
PuppetLint::RakeTask.new(:lint) do |config|
  # Pattern of files to ignore
  config.ignore_paths = exclude_paths
  # Pattern of files to check, defaults to `**/*.pp`
  config.pattern = ['manifests/**/*.pp']
  # List of checks to disable
  config.disable_checks = ['140chars', 'relative', 'class_inherits_from_params_class']
  # Should the task fail if there were any warnings, defaults to false
  config.fail_on_warnings = true
  # Print out the context for the problem, defaults to false
  #config.with_context = true
  # Log Format
  #config.log_format = '%{path}:%{line}:%{check}:%{KIND}:%{message}'
end

PuppetSyntax.exclude_paths = exclude_paths

# vim: syntax=ruby
