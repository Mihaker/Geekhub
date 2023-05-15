class AuthorsController < ApplicationController
  def new
    @author = Author.new
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
end