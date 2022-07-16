class HomeController < ApplicationController 
    before_action :require_user_logged_in!
    before_action :require_set_profile!
    def index 
        @post = Post.new
        @posts = Post.all
        @profiles = Profile.all
        # @post
    end
end