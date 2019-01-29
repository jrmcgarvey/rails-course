class UsersController < ApplicationController
    def new
    end
    
    def create
        user=User.new
        user.name=params[:name]
        user.save
        redirect_to '/users'
    end
    
    def index
        @users=User.all
    end
    
    def edit
        @user=User.find(params[:id])
    end
    
    def update
        user=User.find(params[:id])
        user.name=params[:name]
        user.save
        redirect_to '/users'
    end
    
    def show
        @user=User.find(params[:id])
    end
    
    def delete
        user=User.find(params[:id])
        Post.where("user_id = ?",params[:id]).delete_all
        user.destroy
        redirect_to '/users'
    end
end
