class SessionsController < ApplicationController 
    before_action :already_logged_in!, only: [:new, :create]
    def new
    end

    def create 
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            if user.profile.present?
                redirect_to root_path, notice: "Successfully Logged in!"
            else
                redirect_to new_user_profile_path(user.id), notice: "Login successful, set up a profile first!"
            end
        else
            render :new
            flash[:notice] = 'Invalid email or password!'
        end
    end

    def destroy 
        session[:user_id] = nil 
        redirect_to login_path, notice: 'Logged Out!'
    end
end
