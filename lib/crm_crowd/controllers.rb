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
      # Create or return current crowd user as FFCRM User model
      # (User is pegged via email.)

      # Try AuthLogic first (handles HTTP Basic Auth for XML API), fall back to crowd.
      if current_user_session && current_user_session.respond_to?(:record)
        @current_user ||= current_user_session.record
      else
        if crowd_authenticated?
          user = User.find_or_create_by_email(:email      => crowd_current_user[:attributes][:mail],
                                              :username   => crowd_current_user[:name],
                                              :first_name => crowd_current_user[:attributes][:givenName],
                                              :last_name  => crowd_current_user[:attributes][:sn])
          @current_user ||= user
        end
      end

      # Set locale to user preference.
      if @current_user && @current_user.preference[:locale]
        I18n.locale = @current_user.preference[:locale]
      end
      User.current_user = @current_user
    end
end

AuthenticationsController.class_eval do

  skip_before_filter :require_user, :only => [ :new, :create ]
  before_filter :require_no_user, :only => [ :new, :create ]

  def create
    if crowd_authenticate(params[:username], params[:password])
      flash[:notice] = t(:msg_welcome)
      if current_user.login_count > 1 && current_user.last_login_at?
        flash[:notice] << " " << t(:msg_last_login, l(current_user.last_login_at, :format => :mmddhhss))
      end
      redirect_back_or_default root_url
    else
      flash[:error] = "Sorry, I don't recognize you! Please try again."
      redirect_to :action => :new
    end
  end

  def destroy
    # Try logout with Authlogic first (for XML api
    if current_user_session && current_user_session.respond_to?(:destroy)
      current_user_session.destroy
      @current_user_session, @current_user = nil, nil
    else
      # Log out with Crowd, if not using authlogic.
      crowd_log_out
    end

    flash[:notice] = t(:msg_goodbye)
    redirect_back_or_default login_url
  end

end

