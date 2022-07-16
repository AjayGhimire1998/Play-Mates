class SessionsController < ApplicationController 
    before_action :already_logged_in!, only: [:new, :create]
    def omniauth 
        # binding.pry
        @user = 
            User.find_or_create_by(email: auth[:info][:email]) do |u|
                u.email = auth[:info][:email]
                u.first_name = auth[:info][:first_name]
                u.last_name = auth[:info][:last_namename]
                u.provider = auth[:provider]
                u.uid = auth[:uid]
                u.password = SecureRandom.hex(10)
            end
        if @user.valid? && @user.save 
            
            session[:user_id] = @user.id 
            redirect_to root_path, notice: "Login Successful through Google."
        else
            redirect_to login_path, notice: "Crediential Errors."
        end
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

    private 
    def auth 
        request.env['omniauth.auth']
    end
end
