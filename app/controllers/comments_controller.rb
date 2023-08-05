class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        @comment.user = current_user
        if @comment.save
            redirect_to @post
        else
            render 'new'
        end
    end

    def update
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
        if @comment.update(comment_params)
            redirect_to @post
        else
            render 'edit'
        end
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])

        @comment.destroy
        redirect_to @post
    end

    private
    def comment_params
        params.require(:comment).permit(:body)
    end
end
