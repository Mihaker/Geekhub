class SessionsController < ApplicationController

  def new; end

  def create
    author = Author.find_by email: params[:session][:email]
    if
      author&.authenticate params[:session][:password]
      session[:author_id] = author.id
      redirect_to root_path
    else
      flash[:info] = 'incorrect password/e-mail'
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:author_id)
    @current_user = nil
    flash[:info] = "ви вийшли з системи"
    redirect_to root_path
  end
end
