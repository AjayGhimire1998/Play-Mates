class RegistrationsController < ApplicationController 
    before_action :already_logged_in!, only: [:new, :create]
    def new 
        @user = User.new
    end

    def create 
        @user = User.create(user_params)
        if @user.save 
            session[:user_id] = @user.id
            redirect_to login_path, notice: "Registration Successful."
        else
            render :new
            flash[:notice] = "Registration Unsuccessful. Try again."
        end
    end
    
    private
    def user_params 
        params.require(:user).permit([:first_name, :last_name,:email, :password, :password_confirmation, :provider, :uid])
    end
end