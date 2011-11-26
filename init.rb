require "fat_free_crm"

# Disable plugin for test & cucumber environments.
if ENV['crowd_auth'] || !%w(test cucumber).include?(Rails.env)

  FatFreeCRM::Plugin.register(:crm_crowd, self) do
            name "Crowd"
          author "Nathan Broadbent"
         version "1.0"
     description "Authentication with Atlassian Crowd"
  end

  require "crm_crowd"
  
else
  # Remove view paths if plugin is not initialized.
  paths = ActionController::Base.view_paths.dup; paths.pop; ActionController::Base.view_paths = paths
end

