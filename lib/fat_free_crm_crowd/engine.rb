module ::FatFreeCrmCrowd
  class Engine < Rails::Engine
    config.to_prepare do
      require 'fat_free_crm_crowd/application_controller'
      require 'fat_free_crm_crowd/authentications_controller'
    end
  end
end
