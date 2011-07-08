# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "lucio"
  gem.homepage = "https://github.com/pbalduino/lucio"
  gem.license = "MIT"
  gem.summary = %Q{Lucio is a LISP-like language}
  gem.description = %Q{Lucio is intended to be a Lisp-like language developed in Ruby only for knowledge and fun.}
  gem.email = "pbalduino+github@gmail.com"
  gem.authors = ["Plinio Balduino", "Rodrigo Lorca"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "lucio #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
