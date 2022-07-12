class HomeController < ApplicationController 
    before_action :require_user_logged_in!
    def index 
        @post = Post.new
        @posts = Post.all
    end
end