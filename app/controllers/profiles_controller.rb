class ProfilesController < ApplicationController
    # before_action :require_set_profile!, only: [:edit, :update]

    def index
        @profiles = Profile.all 
    end

    def new 
        @user = @current_user
        @profile = @user.build_profile

    end

    def create 
        @profile = @current_user.build_profile(profile_params)
        if @profile.save 
            redirect_to user_profile_path(@current_user.id, @current_user.profile.id), notice: "Profile successfully created!"
        else
            render :new
            flash[:notice] = "Unsuccessful!"
        end
    end

    def show
        @user = @current_user  
        @profile = @current_user.profile
        if @profile.nil?
            redirect_to root_path, notice: "Profile not set up!"
        end 
    end

    def edit 
        @user = @current_user
        @profile = @current_user.profile
    end

    def update 
        @profile = @current_user.profile
        if @profile.update(profile_params)
            redirect_to user_profile_path(@current_user.id), notice: "Profile successfully updated!"
        else
            render :edit 
            flash[:notice] = "Unsuccessful!"
        end
    end

    private 
    def profile_params 
        params.require(:profile).permit(:username, :avatar, :user_id, :bio, :cover)
    end
end
