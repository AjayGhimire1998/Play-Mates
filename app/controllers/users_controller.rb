class UsersController < ApplicationController

    def destroy 
        session[:user_id] = nil
        @current_user.destroy
        redirect_to login_path, notice: "Successfully Deleted Account !!"
    end
end
