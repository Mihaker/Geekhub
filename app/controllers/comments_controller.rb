class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create! comments_params
    flash[:success] = 'Коментар створено'
    redirect_to post_path(@post)
  end


  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end


  def publish
    @post = Post.find(params[:id])
    @comment = @post.comments.find(params[:comment_id])

    if @comment.update(status: 'published')
      flash[:success] = "Коментар опубліковано."
    else
      flash[:error] = "Error publishing comment."
    end

    redirect_to post_path(@post)
  end

  private

  def comments_params
    params.require(:comment).permit(:body, :author_id, :status)
  end
end
