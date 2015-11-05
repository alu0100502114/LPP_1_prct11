require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Ejecutar build"
task :build do
  sh "gem build Bibliografia.gemspec"
end

desc "Ejecutar la gema"
task :install do
    sh "gem icd ./install ./Bibliografia-0.1.0.gem"
end

desc "Ejecutar con RubyGems"
task :release do
  sh "gem build Bibliografia.gemspec"
end

desc "Ejecutar las espectativas de la clase Bibliografia"
task :spec do
  sh "rspec -I. spec/bibliografia_spec.rb"
end