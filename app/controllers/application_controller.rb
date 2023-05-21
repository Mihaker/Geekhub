class ApplicationController < ActionController::Base
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def current_user
    @current_user ||= Author.find_by(id: session[:author_id]) if session[:author_id].present?
  end

  def author_signed_in?
    current_user.present?
  end

  helper_method :author_signed_in?, :current_user

  def user_not_authorized
    flash[:warning] = "Ви не увійшли в систему"
    redirect_to(request.referrer || root_path)
  end
end
