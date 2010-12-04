require 'crowd'

begin
  crowd_settings = YAML.load_file(::Rails.root.join('config/crowd_settings.yml'))
  crowd_settings[:crowd].each{|k,v| Crowd.send("#{k}=",v) }
rescue LoadError
  puts "Please run '$ ruby install.rb' in vendor/plugins/crm_crowd to setup config/crowd_settings.yml"
end
