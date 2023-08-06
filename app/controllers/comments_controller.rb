class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
        @post = Post.find(params[:comment][:post_id])
        @comment = @post.comments.create(comment_params)
        @comment.user = current_user
        if @comment.save
            redirect_to posts_path
        else
            render 'new'
        end
    end

    def update
        @post = Post.find(params[:comment][:post_id])
        @comment = Comment.find(params[:id])
        if @comment.update(comment_params)
            redirect_to posts_path
        else
            render 'edit'
        end
    end

    def destroy
        @comment = Comment.find(params[:id])

        @comment.destroy
        redirect_to posts_path
    end

    private
    def comment_params
        params.require(:comment).permit(:content, :post_id, :user_id)
    end
end
