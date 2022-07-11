class PostsController < ApplicationController
    def index 
        @posts = Post.all
    end

    def new 
        @post = Post.new
    end 

    def create 
        @post = Post.new(post_params)
        if @post.save 
            redirect_to root_path, notice: "Post Uploaded!"
        else
            render :new
            flash[:notice] = "Post creation is unsuccessful!"
        end
    end

    def show 
        @post = Post.find(params[:id])
    end

    def edit 
        @post = Post.find(params[:id])
    end

    def update 
        @post = Post.find(params[:id])
        if @post.update 
            redirect_to root_path, notice: "Post Updates!"
        else
            render :edit
            flash[:notice] = "Post update is unsuccessful!"
        end
    end
    
    def destroy
    end

    private 

    def post_params 
        params.require(:post).permit(:caption, :image, category_ids:[], categories_attributes: [:name])
    end

end
