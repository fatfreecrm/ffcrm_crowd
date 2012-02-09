AuthenticationsController.class_eval do

  skip_before_filter :require_user, :only => [ :new, :create ]
  before_filter :require_no_user, :only => [ :new, :create ]

  def create
    @current_user_session, @current_user = nil, nil
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
