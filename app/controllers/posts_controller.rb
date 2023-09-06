class PostsController < ApplicationController
    before_action :require_set_profile! 
    
    def index 
        @posts = Post.all
        
        if !params[:category].blank?
            @posts = Post.by_category(params[:category])
        else
            @posts = Post.all
        end


    end

    def new 
        @post = Post.new     
    end 

    def create 
        # raise params.inspect
        @post = Post.create(post_params)
 
        if @post.save 
            redirect_to root_path, notice: "Post Uploaded!"
        else
            render :new
            flash[:notice] = "Post creation is unsuccessful!"
        end
    end

    def show 
        @posts = @current_user.posts
    end

    def edit 
        @post = @current_user.posts.find(params[:id])
    end

    def update 
        @post = @current_user.posts.find(params[:id])
        if @post.update(post_params)
            redirect_to root_path, notice: "Post is successfully updated!"

        else
            render :edit
            flash[:notice] = "Post update is unsuccessful!"
        end
    end
    
    def destroy
        @post = @current_user.posts.find(params[:id])
        @post.destroy 
        redirect_to root_path, notice: "Post Successfully Destroyed!"
    end

    private 

    def post_params 
        params.require(:post).permit(:caption, :post_file, :user_id, category_ids:[], categories_attributes: [:name])
    end

end
