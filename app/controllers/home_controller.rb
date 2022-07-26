class HomeController < ApplicationController 
    before_action :require_user_logged_in!
    before_action :require_set_profile!
    def index 
        @post = Post.new
        @posts = Post.all
        @profiles = Profile.all
        
        if @posts.length > 10
            @over_ten = true
            @posts = @posts[0..9]
        end

        if params[:more]
            @over_ten = false
            @posts = Post.all
        end
    end
end