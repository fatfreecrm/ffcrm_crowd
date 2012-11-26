ApplicationController.class_eval do
  include Crowd::SingleSignOn

  private

    #----------------------------------------------------------------------------
    def current_user_session
      @current_user_session ||= Authentication.find

      # Try AuthLogic first (handles HTTP Basic Auth for XML API), fall back to crowd.
      if @current_user_session && @current_user_session.respond_to?(:record)
        if @current_user_session.record.suspended?
          @current_user_session = nil
        end
      end

      # If @current_user_session fails with AuthLogic, try with crowd.
      @current_user_session ||= crowd_token
    end

    #----------------------------------------------------------------------------
    def current_user
      unless @current_user
        # Create or return current crowd user as FFCRM User model
        # (User is pegged via email.)

        # Try AuthLogic first (handles HTTP Basic Auth for XML API), fall back to crowd.
        if current_user_session && current_user_session.respond_to?(:record)
          @current_user ||= current_user_session.record
        else
          if crowd_authenticated?
            unless user = User.find_by_username(crowd_current_user[:name])
              # Update username if email is found
              if user = User.find_by_email(crowd_current_user[:attributes][:mail])
                user.update_attribute(:username, crowd_current_user[:name])
              else
                user = User.create!(:username   => crowd_current_user[:name],
                                    :email      => crowd_current_user[:attributes][:mail],
                                    :first_name => crowd_current_user[:attributes][:givenName],
                                    :last_name  => crowd_current_user[:attributes][:sn])
              end
            end

            @current_user = user
          end
        end

        # Set locale to user preference.
        if @current_user
          @current_user.set_individual_locale
          @current_user.set_single_access_token
        end
        User.current_user = @current_user
      end
      @current_user
    end
end
