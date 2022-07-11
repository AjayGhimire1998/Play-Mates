class HomeController < ApplicationController 
    def index 
        if @current_user.nil?
            redirect_to login_path, notice: "You should login first!"
        end
    end
end