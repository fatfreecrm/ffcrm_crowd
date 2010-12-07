# require File.expand_path(File.dirname(__FILE__) + '/../../spec/factories')

# Set crowd to use test configuration

test_config = YAML.load(\
%Q^crowd_url: https://auth.crossroads.org.hk/crowd/services/SecurityServer
crowd_app_name: rails-test
crowd_app_pword: testing
crowd_validation_factors_need_user_agent: false
crowd_session_validationinterval: 0  # Set > 0 for authentication caching.^)

test_config.each{|k,v| Crowd.send("#{k}=",v) }
