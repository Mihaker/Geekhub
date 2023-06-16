class CommentsController < ApplicationController
  before_action :set_comment!, only: %i[destroy update edit vote_down vote_up]

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
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

  def vote_up
    @comment.liked_by current_user
    redirect_to @post
  end

  def vote_down
    @comment.downvote_from current_user
    redirect_to @post
  end

  private

  def set_comment!
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def comments_params
    params.require(:comment).permit(:body, :author_id, :status, :parent_id)
  end

end
