class LikesController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @like = @post.likes.create(like_params)
        @like.user = current_user
        if @like.save
            redirect_to @post
        else
            render 'new'
        end
    end

    def destroy
        @post = Post.find(params[:post_id])
        @like = Like.find(params[:id])

        @like.destroy
        redirect_to @post
    end

    private
    def like_params
        params.require(:like).permit(:body)
    end
end
