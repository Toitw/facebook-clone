class LikesController < ApplicationController
    before_action :authenticate_user!

    def create
        @post = Post.find(params[:like][:post_id])
        @like = @post.likes.find_by(user: current_user)
      
        if @like
          # User already liked the post, so we destroy the like
          @like.destroy
        else
          # User has not liked the post yet, so we create a new like
          @like = @post.likes.build(user: current_user)
          @like.save
        end
      
        redirect_to posts_path
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
