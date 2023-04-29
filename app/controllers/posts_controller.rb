class PostsController < ApplicationController
  def create
    @post = Post.new post_params

    if @post.save
      flash[:success] = 'Публікацію створенно'
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update post_params
      flash[:success] = 'Публікацію оновленно'
      redirect_to @post
    else
      render :edit
    end
  end

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.all

    @comments = if params[:filter] == "unpublished"
                  @comments.where(status: "unpublished")
    else
      @comments.where(status: "published")
                end

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:info] = 'Публікацію виделано'
    redirect_to root_path
  end

  def publish_comment
    @post = Post.find(params[:id])
    @comment = @post.comments.find(params[:comment_id])

    if @comment.update(status: 'published')
      flash[:success] = "Коментар опубліковано."
    else
      flash[:error] = "Error publishing comment."
    end

    redirect_to @post
  end
  private

  def post_params
    params.require(:post).permit(:name, :title, :content, :image, :author_id)
  end
end
