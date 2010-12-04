require "fat_free_crm"

FatFreeCRM::Plugin.register(:crm_crowd, self) do
          name "Crowd"
        author "Nathan Broadbent"
       version "1.0"
   description "Authentication with Atlassian Crowd"
end

require "crm_crowd"

Rails.configuration.middleware.insert_before ::Rack::Lock, ::ActionDispatch::Static, root.join('public')
