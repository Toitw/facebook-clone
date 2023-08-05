class LikesController < ApplicationController
    before_action :authenticate_user!

    def create
        @post = Post.find(params[:post_id])
        @like = current_user.likes.build(post: @post)
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
        params.require(:like).permit(:body)
    end
end
