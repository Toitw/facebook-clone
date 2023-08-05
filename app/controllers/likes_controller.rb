class LikesController < ApplicationController
    before_action :authenticate_user!

    def create
        @post = Post.find(params[:like][:post_id])
        @user = current_user
        @like = @post.likes.build(user: current_user)
        if @like.save
            redirect_to posts_path
        else
            render 'new'
        end
    end

    def destroy
        @post = Post.find(params[:post_id])
        @like = Like.find(params[:id])

        @like.destroy
        redirect_to posts_path
    end

    private
    def like_params
        params.require(:like).permit(:post_id, :user_id)
    end
end
