class ApplicationController < ActionController::Base

  private

  def current_author
    @current_author ||= Author.find_by(id: session[:author_id]) if session[:author_id].present?
  end

  def author_signed_in?
    current_author.present?
  end

  helper_method :author_signed_in?, :current_author
end
