class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    helper_method :logged_in?,:current_user

    def log_in_user!(user)
        session[:session_token]= user.reset_session_token!
    end 

    def logged_in?
        !!current_user
    end 

    def current_user
       @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def log_out
        if logged_in?
            current_user.reset_session_token!
        end
        session[:session_token] = nil 
        @current_user = nil 
    end 

    def require_login
        redirect_to new_session_url unless logged_in?
    end
    
    
end
