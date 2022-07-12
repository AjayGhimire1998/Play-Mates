class PostsController < ApplicationController
    def index 
        @posts = Post.all
    end

    def new 
        @post = Post.new
        # @user = @current_user
       
    end 

    def create 
        @post = Post.create(post_params)
        # raise params.inspect
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
        params.require(:post).permit(:caption, :video, :user_id, category_ids:[], categories_attributes: [:name])
    end

end
