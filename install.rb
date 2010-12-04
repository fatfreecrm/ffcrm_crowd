require 'rubygems'
require 'fileutils'

example_path = File.join(File.dirname(__FILE__),'config','crowd_settings.yml.example')
destination_path = File.expand_path(File.join(File.dirname(__FILE__),'..','..','..','config','crowd_settings.yml'))

FileUtils.copy example_path, destination_path

# -----------------------------------------------------------------
# Appends required gems to root Gemfile

gemfile_path = File.join(File.dirname(__FILE__),'..','..','..','Gemfile')
current_gemfile = File.open(gemfile_path, 'r').read

required_gems = {"soap4r"           => ":git => 'git://github.com/tribalvibes/soap4r-spox.git'",
                 "crowd-crossroads" => ":git => 'git://github.com/crossroads/crowd.git'",
                 "crowd_rails"      => ":git => 'git://github.com/crossroads/crowd_rails.git'"}

gemfile_modified = false
File.open(gemfile_path, 'a') do |f|
  required_gems.each do |gem_name, param|
    unless current_gemfile.include?(gem_name)
      f.puts "\n" unless gemfile_modified  # Add newline if first modification
      param = param ? ", #{param}" : ""
      f.puts "gem '#{gem_name}'#{param}"
      gemfile_modified = true
    end
  end
end

if gemfile_modified
  puts "=== This plugin has modified your root Gemfile to require additional gems.\n    Please run 'bundle update' when installation has finished."
end

puts "=== Please edit '#{destination_path}' with your Crowd server details."
