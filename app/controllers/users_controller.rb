class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        @users = User.where.not(id: current_user.id)
        @user = current_user
        if @user.friends.any?
            @friends = @user.friends
        else
            @friends = []
        end
        @friend_requests = current_user.friend_requests
    end
    
    def show
        @user = current_user
        @posts = @user.posts
    end
    
    private
    
    def user_params
    params.require(:user).permit(:id, :name, :email, :password,
                                    :password_confirmation)
    end

end
