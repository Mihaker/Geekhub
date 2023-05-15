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
    @comments = @comments.where(status: params[:status]) if params[:status].present?
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:info] = 'Публікацію виделано'
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:name, :title, :content, :image, :author_id)
  end
end
