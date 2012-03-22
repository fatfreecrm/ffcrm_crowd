require 'crowd'

if Setting.crowd
  Setting.crowd.each{|k,v| Crowd.send("#{k}=",v) }
else
  puts "Please run '$ ruby install.rb' in vendor/plugins/crm_crowd to setup config/crowd_settings.yml"
end
