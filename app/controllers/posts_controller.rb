class PostsController < ApplicationController
  before_action :set_post!, only: %i[edit update show destroy]
  def create
    @post = Post.new post_params
    authorize @post

    if @post.save
      flash[:success] = 'Публікацію створенно'
      redirect_to @post
    else
      render :new
    end
  end

  def edit; end

  def update
    authorize @post

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
    @comments = @post.comments.roots
    @comment = @post.comments.build
    authorize @post
  end

  def destroy
    authorize @post
    @post.destroy
    flash[:info] = 'Публікацію виделано'
    redirect_to root_path
  end

  private

  def set_post!
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :title, :content, :image, :author_id)
  end
end
