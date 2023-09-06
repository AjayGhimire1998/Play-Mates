class ProfilesController < ApplicationController
    before_action :require_set_profile!, only: [:edit, :update]
    before_action :correct_user_profile, only: [:edit, :update]
    before_action :account_deleted!, only: [:view]

    def index
        @profiles = Profile.all
        if !params[:search].blank? 
            @profiles = Profile.search_by_username(params[:search])
        end
    end

    def new 
        @user = @current_user
        @profile = @user.build_profile
    end

    def create 
        @profile = @current_user.build_profile(profile_params)
        if @profile.save 
            redirect_to  view_profile_path(@current_user), notice: "Profile successfully created!"
        else
            render :new
            flash[:notice] = "Unsuccessful!"
        end
    end

    def view
        @user = User.find(params[:id])
        if @user == @current_user
            @user = @current_user  
            @profile = @current_user.profile
            @posts = @current_user.posts
        else
            @profile = @user.profile
            @posts = @user.posts
        end
    end


    def edit 
        @user = @current_user
        @profile = @current_user.profile
    end

    def update 
        @profile = @current_user.profile
        if @profile.update(profile_params)
            redirect_to view_profile_path(@current_user), notice: "Profile successfully updated!"
        else
            render :edit 
            flash[:notice] = "Unsuccessful!"
        end
    end

    private 
    def profile_params 
        params.require(:profile).permit(:username, :avatar, :user_id, :bio, :cover, :search)
    end
end
