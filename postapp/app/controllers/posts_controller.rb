class PostsController < ApplicationController
    def new
        @users=User.all
    end
    
    def create
        post=Post.new
        post.post_text=params[:post_text]
        post.user_id=params[:user_id]
        post.save
        redirect_to '/posts'
    end
    
    def index
        @posts=Post.all
    end
    
    def edit
        @users=User.all
        @post=Post.find(params[:id])
    end
    
    def update
        post=Post.find(params[:id])
        post.post_text=params[:post_text]
        post.user_id=params[:user_id]
        post.save
        redirect_to '/posts'
    end
    
    def delete
        post=Post.find(params[:id])
        post.destroy
        redirect_to '/posts'
    end
end
