class AuthorsController < ApplicationController
  before_action :set_author!, only: %i[edit show update]
  before_action :logged_in_user, only: %i[edit update]
  before_action :correct_user,   only: %i[edit update]
  
  def new
    @author = Author.new
  end

  def show; end

  def edit; end

  def update

    if @author.update author_params
      flash[:success] = 'Профіль оновлено'
      redirect_to @author
    else
      render :edit
    end
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      session[:author_id] = @author.id
      flash[:success] = "Успішно зареєструвались"
      redirect_to root_path
    else
      render :new
    end
  end

  private 

  def author_params
    params.require(:author).permit(:email, :password, :password_confirmation, :first_name, :last_name, :gender, :birthday)
  end

  def logged_in_user
    return if author_signed_in?

    flash[:error] = "Увійдіть у систему"
    redirect_to login_url
  end

  def correct_user
    @user = Author.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end

  def set_author!
    @author = Author.find(params[:id])
  end
end