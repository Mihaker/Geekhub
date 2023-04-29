class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create! comments_params
    flash[:success] = 'Коментар створено'
    redirect_to post_path(@post)
  end

  private

  def comments_params
    params.require(:comment).permit(:body, :author_id, :status)
  end
end
