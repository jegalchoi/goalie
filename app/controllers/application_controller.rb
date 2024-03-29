class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :logged_in?, :login!, :logout!, :require_user!, :require_owner!

  private

    def current_user
      @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def login!(user)
      @current_user = user
      session[:session_token] = user.reset_session_token!
    end
    
    def logout!
      current_user.reset_session_token!
      session[:session_token] = nil
    end
    
    def logged_in?
      !!current_user
    end

    def require_user!
      redirect_to new_session_url unless logged_in?
    end

    def require_owner!
      redirect_to new_session_url unless current_user.id == Goal.find_by(id: params[:id]).user_id
    end

end
