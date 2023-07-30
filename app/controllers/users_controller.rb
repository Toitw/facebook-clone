class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        @users = User.where.not(id: current_user.id)
    end
    
    def show
        @user = current_user
    end
    
    private
    
    def user_params
    params.require(:user).permit(:name, :email, :password,
                                    :password_confirmation)
    end

end
