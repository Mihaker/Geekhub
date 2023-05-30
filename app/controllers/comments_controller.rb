class CommentsController < ApplicationController
  before_action :set_comment!, only: %i[destroy update edit]

  def new
   Comment.new
  end
  
  def edit; end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build comments_params
    authorize @comment

    if @comment.save
      flash[:success] = 'Коментар створено'
    else
      flash[:error] = 'Помилка при стовренні коментаря'
    end
    redirect_to post_path(@post)
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post)
  end


  def update
    if @comment.update(comments_params)
      redirect_to @post, notice: 'Коментар оновлено'
    else
      render :edit
    end
  end

  private

  def set_comment!
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:comment_id])
  end

  def comments_params
    params.require(:comment).permit(:body, :author_id, :status, :parent_id)
  end
end
