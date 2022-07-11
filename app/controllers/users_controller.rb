class UsersController < ApplicationController
    def destroy 
        session[:user_id] = nil
        @current_user.destroy
        redirect_to signup_path, notice: "Successfully Deleted Account !!"
    end
end
