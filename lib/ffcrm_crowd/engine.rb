module FatFreeCRM::Crowd
  class Engine < Rails::Engine
    config.to_prepare do
      require 'ffcrm_crowd/application_controller'
      require 'ffcrm_crowd/authentications_controller'
    end
  end
end
