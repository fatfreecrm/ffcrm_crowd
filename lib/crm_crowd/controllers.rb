ApplicationController.class_eval do
  include Crowd::SingleSignOn    
  
  before_filter :authenticate
  
  private

    #----------------------------------------------------------------------------
    def authenticate
      session[:where_to] = request.fullpath
      redirect_to :login unless crowd_authenticated?
    end   
      
    #----------------------------------------------------------------------------
    def current_user_session
      
      @current_user_session ||= crowd_token

#      @current_user_session ||= Authentication.find
#      if @current_user_session && @current_user_session.record.suspended?
#        @current_user_session = nil
#      end
#      @current_user_session
    end

    #----------------------------------------------------------------------------
    def current_user
      # Create or return current crowd user as FFCRM User model
      # (User is pegged via email.)
      
      if crowd_authenticated?
        user = User.find_or_create_by_email(:email      => crowd_current_user[:attributes][:mail],
                                            :username   => crowd_current_user[:name],
                                            :first_name => crowd_current_user[:attributes][:givenName],
                                            :last_name  => crowd_current_user[:attributes][:sn])
        @current_user ||= user
      end
      
      if @current_user && @current_user.preference[:locale]
        I18n.locale = @current_user.preference[:locale]
      end
      User.current_user = @current_user
      
#      @current_user ||= (current_user_session && current_user_session.record)
#      if @current_user && @current_user.preference[:locale]
#        I18n.locale = @current_user.preference[:locale]
#      end
#      User.current_user = @current_user
    end
      
end

AuthenticationsController.class_eval do

  skip_before_filter :authenticate
  before_filter :require_no_user, :only => [ :new, :create ]
  before_filter :require_user, :only => :destroy
  
  def create
    if crowd_authenticate(params[:username], params[:password])
      redirect_to(session[:where_to] || root_path)
    else
      flash[:error] = "Sorry, I don't recognize you! Please try again."
      redirect_to(login_path)
    end
  end

  def destroy
    crowd_log_out
    session[:where_to] = nil
    redirect_to root_path
  end
  
end
