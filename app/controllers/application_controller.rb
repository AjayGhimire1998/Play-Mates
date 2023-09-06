class ApplicationController < ActionController::Base
    protect_from_forgery 
    before_action :current_user
    before_action :find_location
    helper_method :current_user, :users, :uniq_name, :all_profiles, :searched_category, :searched_user

    def current_user 
       @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def users 
        User.all
    end

    def already_logged_in! 
        if @current_user.present?
            redirect_to root_path, notice: "You are already logged in!" if @current_user
        end
    end

    def account_deleted! 
        if @current_user.nil?
            redirect_to login_path, notice: "Account Deleted Successfully!"
        end
    end

    def require_user_logged_in!
        redirect_to login_path, notice: "You must be logged in!" if @current_user.nil?
    end

    def require_set_profile! 
        redirect_to new_user_profile_path(user_id: @current_user), notice: "Profile not set up!" if @current_user.profile.nil?
    end

    def current_user_ip
        request.remote_ip
    end

    def find_location 
        @geocoder = Geocoder.search(current_user_ip)[0]
        if @geocoder.city.nil? && @geocoder.country.nil?
            @current_country = "Sweet Home"
            @current_city = "Home"
        else
            @current_country = @geocoder.country
            @current_city = @geocoder.city
        end
    end

    def correct_user_profile
        @user_profile = current_user.profile
        redirect_to root_path, notice: "Not authorized" if @user_profile.nil?
    end

    def uniq_name
        Category.distinct.pluck(:name)
    end

    def all_profiles 
        Profile.search_by_username(params[:search])
    end

    def searched_category 
        Category.find_by(id: params[:category]).name
    end



end
