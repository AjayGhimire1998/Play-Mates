class ApplicationController < ActionController::Base
    before_action :current_user
    helper_method :current_user

    def current_user 
       @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def already_logged_in! 
        if @current_user.present?
            redirect_to root_path, notice: "You are already logged in!" if @current_user
        end
    end

    def require_user_logged_in!
        redirect_to login_path, notice: "You must be logged in!" if @current_user.nil?
    end

    def require_set_profile! 
        redirect_to new_user_profile_path(user_id: @current_user)
    end

end
